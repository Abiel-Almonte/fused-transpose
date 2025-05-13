```cpp
transpose_inplace_tiled_simd(A, m, stride);
mkl_simatcopy('R', 'T', m, m, 1.0f, A, stride, stride);
```
![bar-chart](./images/bandwidth_bar_chart.png)
![cache-blocking](./images/blocking.png)
![specialization](./images/specialization.png)
![8x8-transpose](./images/8x8_transpose.png)
![bar-chart](./images/perf_radar_chart.png)