#include <stdio.h>
#include <deviceFunctions.h>

void printDeviceInfo()
{
	int deviceCount;

	cudaGetDeviceCount(&deviceCount);

	printf("Device Count: %i\n", deviceCount);
}