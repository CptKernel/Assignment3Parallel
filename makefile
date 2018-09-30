CC=nvcc
DEPS = deviceFunctions.h matrixScaleAndAddFunctions.h cudaMatrixScaleAndAddFunctions.h
CFLAGS=-I.
CDI_OBJ = cudaDeviceInfo.obj deviceFunctions.obj 
MSAA_OBJ = matrixScaleAndAdd.obj matrixScaleAndAddFunctions.obj
CMSAA_OBJ = cudaMatrixScaleAndAdd.obj cudaMatrixScaleAndAddFunctions.obj matrixScaleAndAddFunctions.obj

%.obj: %.cu $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all: cudaDeviceInfo matrixScaleAndAdd cudaMatrixScaleAndAdd
	
cudaDeviceInfo: $(CDI_OBJ)
	$(CC) -o cudaDeviceInfo $^ $(CFLAGS)

matrixScaleAndAdd: $(MSAA_OBJ)
	$(CC) -o matrixScaleAndAdd $^ $(CFLAGS)

cudaMatrixScaleAndAdd: $(CMSAA_OBJ)
	$(CC) -o cudaMatrixScaleAndAdd $^ $(CFLAGS)

.PHONY: clean
clean:
	rm -f cudaDeviceInfo.out cudaDeviceInfo.exp cudaDeviceInfo.exe cudaDeviceInfo.lib *.obj
	rm -f matrixScaleAndAdd.out matrixScaleAndAdd.exp matrixScaleAndAdd.exe matrixScaleAndAdd.lib
	rm -f cudaMatrixScaleAndAdd.out cudaMatrixScaleAndAdd.exp cudaMatrixScaleAndAdd.exe cudaMatrixScaleAndAdd.lib
	