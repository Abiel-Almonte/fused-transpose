#include <immintrin.h>
#include <algorithm>
#include <cstdint>

constexpr uint32_t BLOCK_DIM= 32;
constexpr uint32_t TILE_DIM= 8;
constexpr uint32_t TILES_PER_BLOCK_DIM= BLOCK_DIM / TILE_DIM;

constexpr uint32_t SHFL_LO_MASK= 0b01000100; //get even pair
constexpr uint32_t SHFL_HI_MASK= 0b11101110; //get odd pair
constexpr uint32_t PERMUTE_LO_MASK= 0b00100000; //get first half of each
constexpr uint32_t PERMUTE_HI_MASK= 0b00110001; //get second half of each

//transpose 1x1 with indices
inline void swap_scalar(float* alignedA, const uint32_t tile_base_addr, const uint32_t tile_base_addr_T, const uint32_t i, const uint32_t j, const uint32_t stride);

//tranpose 8x8 with registers
inline void simd_transpose_8x8(const float* src, const uint32_t src_stride, float* dst, const uint32_t dst_stride);
inline void swap_tile(float* alignedA, float buffer[TILE_DIM][TILE_DIM], const uint32_t block_base_addr, const uint32_t block_base_addr_T, const uint32_t ti, const uint32_t tj, const uint32_t stride);

extern "C" {
  void transpose_inplace_tiled_simd(float* A, const uint32_t m, const uint32_t stride) {
    float* alignedA= static_cast<float*>(__builtin_assume_aligned(A, 64));
    alignas(32) float row_buffer[TILE_DIM][TILE_DIM];
    
    uint32_t num_blocks= (m + BLOCK_DIM - 1)/BLOCK_DIM;
    uint32_t full_blocks= m/BLOCK_DIM;
    
    //PATH 1: Full Block
    for (uint32_t bi= 0; bi < full_blocks; bi++) {
      for (uint32_t bj= bi+1; bj < full_blocks; bj++) {
        uint32_t block_base_addr= bi*BLOCK_DIM*stride + bj*BLOCK_DIM;
        uint32_t block_base_addr_T= bj*BLOCK_DIM*stride + bi*BLOCK_DIM;
        
        //Off Diag Tile
        for (uint32_t ti= 0; ti < TILES_PER_BLOCK_DIM; ti++) {
          for (uint32_t tj= 0; tj < TILES_PER_BLOCK_DIM; tj++) {
            swap_tile(
              alignedA,
              row_buffer,
              block_base_addr,
              block_base_addr_T,
              ti, tj, stride
            );
          }
        }
      }
      
      //Diag Tile
      uint32_t block_base_addr= bi*BLOCK_DIM*stride + bi*BLOCK_DIM;
      for (uint32_t ti= 0; ti < TILES_PER_BLOCK_DIM; ti++) {
        for (uint32_t tj= ti; tj < TILES_PER_BLOCK_DIM; tj++) {
          swap_tile(
            alignedA,
            row_buffer,
            block_base_addr,
            block_base_addr,
            ti, tj, stride
          );
        }
      }
    }
    
    //Edge Blocks 
    if(num_blocks > full_blocks){
      uint32_t partial_block_small_dim= m - full_blocks*BLOCK_DIM;
      uint32_t full_tiles= partial_block_small_dim/TILE_DIM;
      uint32_t partial_tile_small_dim= partial_block_small_dim%TILE_DIM;
      
      //PATH 3: Edge Block, Full and Edge Tile
      for (uint32_t bi= 0; bi < full_blocks; bi++){
        uint32_t block_base_addr= bi*BLOCK_DIM*stride + full_blocks*BLOCK_DIM;
        uint32_t block_base_addr_T= full_blocks*BLOCK_DIM*stride + bi*BLOCK_DIM;
        
        //Full Tile
        for (uint32_t ti= 0; ti < TILES_PER_BLOCK_DIM; ti++){
          for (uint32_t tj= 0; tj < full_tiles; tj++){
            swap_tile(
              alignedA,
              row_buffer,
              block_base_addr,
              block_base_addr_T,
              ti, tj, stride
            );
          }
        }
        
        //Edge Tile
        for (uint32_t ti= 0; ti < TILES_PER_BLOCK_DIM; ti++){
          uint32_t tile_base_addr= block_base_addr + ti*TILE_DIM*stride + full_tiles*TILE_DIM;
          uint32_t tile_base_addr_T= block_base_addr_T + full_tiles*TILE_DIM*stride + ti*TILE_DIM;
          
          for (uint8_t i= 0; i < TILE_DIM; i++){
            for (uint8_t j= 0; j < partial_tile_small_dim; j++){
              swap_scalar(
                alignedA,
                tile_base_addr,
                tile_base_addr_T,
                i, j, stride
              );
            }
          } 
        }
      }
      
      //PATH 4: Diag Edge Block, Full Tile
      uint32_t block_base_addr= full_blocks*BLOCK_DIM*stride + full_blocks*BLOCK_DIM;
      for(uint32_t ti= 0; ti < full_tiles; ti++){ //can be cut off by bottom edge small dim
        for(uint32_t tj= ti; tj < full_tiles; tj++){
          swap_tile(
            alignedA,
            row_buffer,
            block_base_addr,
            block_base_addr,
            ti, tj, stride
          );
        }
      }
      
      //PATH 5: Diag Edge Block, Edge Tile
      for (uint32_t ti= 0; ti< full_tiles; ti++){
        uint32_t tile_base_addr= block_base_addr + ti*TILE_DIM*stride + full_tiles*TILE_DIM;
        uint32_t tile_base_addr_T= block_base_addr + full_tiles*TILE_DIM*stride+ ti*TILE_DIM;
        
        for (uint32_t i= 0; i < TILE_DIM; i++){
          for (uint32_t j= 0; j < partial_tile_small_dim; j++){
            swap_scalar(
              alignedA,
              tile_base_addr,
              tile_base_addr_T,
              i, j, stride
            );
          }
        }
      }
      
      //PATH 6: Diag Edge Block, Diag Edge Tile
      uint32_t tile_base_addr= block_base_addr + full_tiles*TILE_DIM*stride + full_tiles*TILE_DIM;
      
      for (uint32_t i= 0; i < partial_tile_small_dim; i++){
        for (uint32_t j= i + 1; j < partial_tile_small_dim; j++){
          swap_scalar(
            alignedA,
            tile_base_addr,
            tile_base_addr,
            i, j, stride
          );
        }
      }
    }
  }
}

inline void swap_scalar(float* alignedA, const uint32_t tile_base_addr, const uint32_t tile_base_addr_T, const uint32_t i, const uint32_t j, const uint32_t stride){
  float temp= alignedA[tile_base_addr + i*stride + j];
  alignedA[tile_base_addr + i*stride + j]= alignedA[tile_base_addr_T + j*stride + i];
  alignedA[tile_base_addr_T + j*stride +i]= temp; 
}

inline void swap_tile(float* alignedA, float buffer[TILE_DIM][TILE_DIM], const uint32_t block_base_addr, const uint32_t block_base_addr_T, const uint32_t ti, const uint32_t tj, const uint32_t stride){
  float* tile= alignedA + block_base_addr + ti*TILE_DIM*stride + tj*TILE_DIM;
  float* tile_T= alignedA + block_base_addr_T + tj*TILE_DIM*stride + ti*TILE_DIM;
  
  for(uint8_t i= 0; i< TILE_DIM; i++){
    _mm256_storeu_ps(buffer[i], _mm256_loadu_ps(tile + i*stride));
  }

  simd_transpose_8x8(tile_T, stride, tile, stride);
  simd_transpose_8x8(&buffer[0][0], TILE_DIM, tile_T, stride);
}

inline void simd_transpose_8x8(const float* src, const uint32_t src_stride, float* dst, const uint32_t dst_stride){
  __m256 r0= _mm256_loadu_ps(src);
  __m256 r1= _mm256_loadu_ps(src + src_stride);
  __m256 r2= _mm256_loadu_ps(src + 2*src_stride);
  __m256 r3= _mm256_loadu_ps(src + 3*src_stride);
  __m256 r4= _mm256_loadu_ps(src + 4*src_stride);
  __m256 r5= _mm256_loadu_ps(src + 5*src_stride);
  __m256 r6= _mm256_loadu_ps(src + 6*src_stride);
  __m256 r7= _mm256_loadu_ps(src + 7*src_stride);

  __m256 quarter_0_1_4_5__0= _mm256_unpacklo_ps(r0, r1);
  __m256 quarter_2_3_6_7__0= _mm256_unpackhi_ps(r0, r1);

  __m256 quarter_0_1_4_5__1= _mm256_unpacklo_ps(r2, r3);
  __m256 quarter_2_3_6_7__1= _mm256_unpackhi_ps(r2, r3);
  
  __m256 quarter_0_1_4_5__2= _mm256_unpacklo_ps(r4, r5);
  __m256 quarter_2_3_6_7__2= _mm256_unpackhi_ps(r4, r5);
  
  __m256 quarter_0_1_4_5__3= _mm256_unpacklo_ps(r6, r7);
  __m256 quarter_2_3_6_7__3= _mm256_unpackhi_ps(r6, r7);

  __m256 half_0_4__0= _mm256_shuffle_ps(quarter_0_1_4_5__0, quarter_0_1_4_5__1, SHFL_LO_MASK);
  __m256 half_0_4__1= _mm256_shuffle_ps(quarter_0_1_4_5__2, quarter_0_1_4_5__3, SHFL_LO_MASK);

  __m256 half_1_5__0= _mm256_shuffle_ps(quarter_0_1_4_5__0, quarter_0_1_4_5__1, SHFL_HI_MASK);
  __m256 half_1_5__1= _mm256_shuffle_ps(quarter_0_1_4_5__2, quarter_0_1_4_5__3, SHFL_HI_MASK);

  __m256 half_2_6__0= _mm256_shuffle_ps(quarter_2_3_6_7__0, quarter_2_3_6_7__1, SHFL_LO_MASK);
  __m256 half_2_6__1= _mm256_shuffle_ps(quarter_2_3_6_7__2, quarter_2_3_6_7__3, SHFL_LO_MASK);

  __m256 half_3_7__0= _mm256_shuffle_ps(quarter_2_3_6_7__0, quarter_2_3_6_7__1, SHFL_HI_MASK);
  __m256 half_3_7__1= _mm256_shuffle_ps(quarter_2_3_6_7__2, quarter_2_3_6_7__3, SHFL_HI_MASK);

  __m256 c0= _mm256_permute2f128_ps(half_0_4__0, half_0_4__1, PERMUTE_LO_MASK);
  __m256 c4= _mm256_permute2f128_ps(half_0_4__0, half_0_4__1, PERMUTE_HI_MASK);

  __m256 c1= _mm256_permute2f128_ps(half_1_5__0, half_1_5__1, PERMUTE_LO_MASK);
  __m256 c5= _mm256_permute2f128_ps(half_1_5__0, half_1_5__1, PERMUTE_HI_MASK);

  __m256 c2= _mm256_permute2f128_ps(half_2_6__0, half_2_6__1, PERMUTE_LO_MASK);
  __m256 c6= _mm256_permute2f128_ps(half_2_6__0, half_2_6__1, PERMUTE_HI_MASK);
  
  __m256 c3= _mm256_permute2f128_ps(half_3_7__0, half_3_7__1, PERMUTE_LO_MASK);
  __m256 c7= _mm256_permute2f128_ps(half_3_7__0, half_3_7__1, PERMUTE_HI_MASK);

  _mm256_storeu_ps(dst, c0);  
  _mm256_storeu_ps(dst + 4*dst_stride, c4);

  _mm256_storeu_ps(dst + dst_stride, c1);
  _mm256_storeu_ps(dst + 5*dst_stride, c5);

  _mm256_storeu_ps(dst + 2*dst_stride, c2);
  _mm256_storeu_ps(dst + 6*dst_stride, c6);

  _mm256_storeu_ps(dst + 3*dst_stride, c3);
  _mm256_storeu_ps(dst + 7*dst_stride, c7);
}