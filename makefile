CC=nvcc
DEPS = deviceFunctions.h
CFLAGS=-I.
CDI_OBJ = cudaDeviceInfo.obj deviceFunctions.obj
MSAA_OBJ = matrixScaleAndAdd.obj

%.obj: %.cu $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all: cudaDeviceInfo matrixScaleAndAdd
	
cudaDeviceInfo: $(CDI_OBJ)
	$(CC) -o cudaDeviceInfo $^ $(CFLAGS)

matrixScaleAndAdd: $(MSAA_OBJ)
	$(CC) -o matrixScaleAndAdd $^ $(CFLAGS)

.PHONY: clean
clean:
	rm -f cudaDeviceInfo.out cudaDeviceInfo.exp cudaDeviceInfo.exe cudaDeviceInfo.lib *.obj
	rm -f matrixScaleAndAdd.out matrixScaleAndAdd.exp matrixScaleAndAdd.exe matrixScaleAndAdd.lib
	