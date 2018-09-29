CC=nvcc
DEPS = deviceFunctions.h
CFLAGS=-I.
OBJ = main.obj deviceFunctions.obj

%.obj: %.cu $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

all: $(OBJ)
	$(CC) -o a $^ $(CFLAGS)

clean:
	rm -f a.out a.exp a.lib