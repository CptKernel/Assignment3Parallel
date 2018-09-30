#include <stdio.h>
#include <cuda_runtime.h>
#include <matrixScaleAndAddFunctions.h>
#include <cudaMatrixScaleAndAddFunctions.h>

#define MAX_MATRIX_SIZE 50

int main(int argc, char *argv[])
{
	float a = atof(argv[1]);
	char *b = argv[2];
	char *c = argv[3];
	char *d = argv[4];

	// Error handling for input. 
	if(argc != 5)
	{
		printError(1, "4");
		return -1;
	}

	printf("Arguments: %f %s %s %s\n", a, b, c, d);
	printf("Test\n");

	int rowsB;
	int rowsC;
	int colsB;
	int colsC;
	float B[MAX_MATRIX_SIZE];
	float C[MAX_MATRIX_SIZE];
	float D[MAX_MATRIX_SIZE];

	getMatrix(&rowsB, &colsB, B, b);
	getMatrix(&rowsC, &colsC, C, c);

	int arraySizeB = rowsB * colsB;
	int arraySizeC = rowsC * colsC;

	if (arraySizeC != arraySizeB)
	{
		printError(2, "");
		return -1;
	}

	scaleAndAddKernel<<<1,1>>>(arraySizeB, a, B, C, D);
	cudaDeviceSynchronize();

	for (int i = 0; i < arraySizeB; i++)
	{
		printf("%f ", D[i]);
	}
	printf("\n");

}

