import timeit
import gc
import os
root_dir = os.path.abspath(os.path.dirname(__file__))
n_run = 100

platform = "c-ext"

######################
# Sum over 10e7 array

setup = """
gc.enable()
import numpy as np
from ctypes import CDLL, POINTER, c_size_t, c_long, c_longlong
from numpy.ctypeslib import ndpointer

# Load the shared library
lib = CDLL('{}/libmethods.so')

# Configure the argument and return types for the C functions

lib.sum_array_int8.argtypes = [ndpointer(dtype=np.int8), c_size_t]
lib.sum_array_int8.restype = c_longlong

lib.sum_array_int64.argtypes = [ndpointer(dtype=np.int64), c_size_t]
lib.sum_array_int64.restype = c_longlong

def sum_array_int8(array):
    return lib.sum_array_int8(array, array.size)

def sum_array_int64(array):
    return lib.sum_array_int64(array, array.size)

a = np.random.randint(2, size=10**7, dtype=np.{})
"""

tt = timeit.Timer('sum_array_int8(a)', setup=setup.format(root_dir, "int8"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} sum-int8 (ms): ", median_time * 1e3)


tt = timeit.Timer('sum_array_int64(a)', setup=setup.format(root_dir, "int64"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} sum-int64 (ms): ", median_time * 1e3)

#####################
# Set array elements (fill)

setup = """
gc.enable()
import numpy as np
from ctypes import CDLL, c_int8, c_int64, c_size_t
from numpy.ctypeslib import ndpointer

# Load the shared library
lib = CDLL('{}/libmethods.so')

# Configure the argument types for the C functions
lib.fill_constant_int8.argtypes = [ndpointer(dtype=np.int8), c_size_t, c_int8]
lib.fill_constant_int64.argtypes = [ndpointer(dtype=np.int64), c_size_t, c_int64]

def fill_constant_int8(array, value):
    lib.fill_constant_int8(array, array.size, value)

def fill_constant_int64(array, value):
    lib.fill_constant_int64(array, array.size, value)

a = np.zeros(10**7, dtype=np.{})
"""

tt = timeit.Timer('fill_constant_int8(a, 1)', setup=setup.format(root_dir, "int8"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} fill-ordered-int8 (ms): ", median_time * 1e3)

tt = timeit.Timer('fill_constant_int64(a, 1)', setup=setup.format(root_dir, "int64"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} fill-ordered-int64 (ms): ", median_time * 1e3)

#####################
# Set array elements (random)

setup = """
gc.enable()
import numpy as np
from ctypes import CDLL, c_int8, c_int64, c_size_t
from numpy.ctypeslib import ndpointer

# Load the shared library
lib = CDLL('{}/libmethods.so')

# Set up the argument types for the fill_specific_indices functions
lib.fill_specific_indices_int8.argtypes = [ndpointer(dtype=np.int8), c_size_t, ndpointer(dtype=np.uintp), c_size_t, c_int8]
lib.fill_specific_indices_int64.argtypes = [ndpointer(dtype=np.int64), c_size_t, ndpointer(dtype=np.uintp), c_size_t, c_int64]

def fill_specific_indices_int8(array, indices, value):
    lib.fill_specific_indices_int8(array, array.size, indices, indices.size, value)

def fill_specific_indices_int64(array, indices, value):
    lib.fill_specific_indices_int64(array, array.size, indices, indices.size, value)

a = np.zeros(10**7, dtype=np.{})
inds = np.arange(len(a)).astype(np.uintp)
np.random.shuffle(inds)
"""

tt = timeit.Timer('fill_specific_indices_int8(a, inds, 1)', setup=setup.format(root_dir, "int8"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} fill-random-int8 (ms): ", median_time * 1e3)

tt = timeit.Timer('fill_specific_indices_int64(a, inds, 1)', setup=setup.format(root_dir, "int64"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} fill-random-int64 (ms): ", median_time * 1e3)