#include <stdio.h>
#include <cuda_runtime.h>
#include <cudaMatrixScaleAndAddFunctions.h>

__global__ void scaleAndAddKernel(int size, float scale, float *B, float *C, float *D)
{
	for (int i = 0; i < size; i++)
	{
		B[i] = scale * B[i];
		printf("%f ", B[i]);
	}
	printf("\n");
}