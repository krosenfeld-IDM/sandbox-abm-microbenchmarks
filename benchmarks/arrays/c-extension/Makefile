CC=gcc
CFLAGS=-fPIC -Wall
LDFLAGS=-shared
TARGET_LIB=libmethods.so

all: $(TARGET_LIB)

$(TARGET_LIB): methods.o
	$(CC) $(LDFLAGS) -o $@ $^

sum_array.o: methods.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o $(TARGET_LIB)