#include <stdio.h>
#include <cuda_runtime.h>

int main(int argc, char *argv[])
{
	float a = atof(argv[1]);
	char *b = argv[2];
	char *c = argv[3];
	char *d = argv[4];

	printf("%i\n", argc);
	printf("%f\n", a);
	printf("%s\n", b);
	printf("%s\n", c);
	printf("%s\n", d);
}