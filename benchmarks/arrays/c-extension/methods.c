#include <stddef.h> // for size_t
#include <stdint.h> // for int8_t, int64_t

#ifndef SUM_ARRAY_H
#define SUM_ARRAY_H

#include <stddef.h> // for size_t
#include <stdint.h> // for int8_t, int64_t

long sum_array_int(const int* array, size_t length);
long long sum_array_int8(const int8_t* array, size_t length);
long long sum_array_int64(const int64_t* array, size_t length);

#endif // SUM_ARRAY_H

// Sum an array of int
long sum_array_int(const int* array, size_t length) {
    long sum = 0;
    for (size_t i = 0; i < length; i++) {
        sum += array[i];
    }
    return sum;
}

// Sum an array of int8_t
long long sum_array_int8(const int8_t* array, size_t length) {
    long long sum = 0;
    for (size_t i = 0; i < length; i++) {
        sum += array[i];
    }
    return sum;
}

// Sum an array of int64_t
long long sum_array_int64(const int64_t* array, size_t length) {
    long long sum = 0;
    for (size_t i = 0; i < length; i++) {
        sum += array[i];
    }
    return sum;
}

// Function to fill specific indices in an int8 array
void fill_specific_indices_int8(int8_t* array, size_t array_size, const size_t* indices, size_t indices_size, int8_t value) {
    for (size_t i = 0; i < indices_size; i++) {
        if (indices[i] < array_size) { // Check to avoid out-of-bounds access
            array[indices[i]] = value;
        }
    }
}

// Function to fill specific indices in an int64 array
void fill_specific_indices_int64(int64_t* array, size_t array_size, const size_t* indices, size_t indices_size, int64_t value) {
    for (size_t i = 0; i < indices_size; i++) {
        if (indices[i] < array_size) { // Check to avoid out-of-bounds access
            array[indices[i]] = value;
        }
    }
}