#include <stdio.h>
#include <deviceFunctions.h>

void printDeviceInfo()
{
	int deviceCount;
	cudaDeviceProp prop;
	int deviceNum = 1;

	cudaGetDeviceCount(&deviceCount);
	cudaGetDeviceProperties(&prop, deviceNum);

	printf("Device Count:            %i\n", deviceCount);
	printf("Global Memory Size:      %zu\n", prop.totalGlobalMem);
	printf("Shared Memory Per Block: %zu\n", prop.sharedMemPerBlock);
	printf("Max Block Dimensions:    %i\n", prop.maxThreadsPerBlock);
	printf("Max Grid Dimensions:     %i\n", prop.maxGridSize[0]);
	printf("Max Grid Dimensions:     %i\n", prop.maxGridSize[1]);
	printf("Max Grid Dimensions:     %i\n", prop.maxGridSize[2]);
	printf("Warp Size:               %i\n", prop.warpSize);
}