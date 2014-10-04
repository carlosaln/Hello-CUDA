#include "cuda_runtime.h"

#include <stdio.h>

__global__ static void sayHello()
{
    int i = blockIdx.x*blockDim.x+threadIdx.x;

    printf("Hello from thread %d!\n", i);
}

int main()
{
    int grid_size;
    int tpb;

    puts("Please enter the grid size: ");
    scanf("%d", &grid_size);

    puts("\nPlease enter the threads per block: ");
    scanf("%d", &tpb);

    puts("\n");

    sayHello<<<grid_size,tpb>>>();

    cudaError_t cudaStatus = cudaDeviceReset();
    if (cudaStatus != cudaSuccess) {
        fprintf(stderr, "cudaDeviceReset failed!");
        return 1;
    }

    return 0;
}