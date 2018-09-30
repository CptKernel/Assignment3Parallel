#include <stdio.h>
#include <matrixScaleAndAddFunctions.h>

// Prints an error message
void printError(int errorNumber, char *errorInfo)
{
	switch (errorNumber)
	{
		case 0:
			fprintf(stderr, "File %s does not exist!", errorInfo);
			break;
		case 1:
			fprintf(stderr, "Invalid number of arguments, must be exactly %s command line arguments.", errorInfo);
			break;
		case 2:
			fprintf(stderr, "Cannot add matrices of different sizes.");
		default:
			fprintf(stderr, "%s", errorInfo);
			break;
	}
}

// Gets the matrix from the specified file
void getMatrix(int *rows, int *cols, float *matrix, char *filename)
{
	FILE *file;
	int numRow;
	int numCol;
	int arraySize;

	file = fopen(filename, "r");
	if(!file)
	{
		printError(0, filename);
		return;
	}

	fscanf(file, "%d %d", &numRow, &numCol);
	arraySize = numRow * numCol;

	for (int i = 0; i < arraySize; i++)
	{
		fscanf(file, "%f", &matrix[i]);
	}

	*rows = numRow;
	*cols = numCol;
	fclose(file);
	return;
}

void scaleMatrix(float scale, int size, float *matrix) 
{
	for (int i = 0; i < size; i++) 
	{
		matrix[i] = matrix[i] * scale;
	}
	return;
}

void addMatrices(int size, float *b, float *c, float *d)
{
	for (int i = 0; i < size; i++)
	{
		d[i] = b[i] + c[i];
	}
}

void outputMatrix(int size, float *matrix, char *filename)
{
	FILE *file;
	file = fopen(filename, "w");

	for (int i = 0; i < size; i++)
	{
		fprintf(file, "%f ", matrix[i]);
	}
	fclose(file);
}
