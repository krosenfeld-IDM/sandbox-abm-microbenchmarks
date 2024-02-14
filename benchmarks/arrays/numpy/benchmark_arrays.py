import timeit
import gc
n_run = 100

platform = "numpy"

######################
# Sum over 10e7 array

setup = """
gc.enable()
import numpy as np

a = np.random.randint(2, size=10**7, dtype=np.{})
"""

tt = timeit.Timer('np.sum(a)', setup=setup.format("int8"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} sum-int8 (ms): ", median_time * 1e3)


tt = timeit.Timer('np.sum(a)', setup=setup.format("int64"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} sum-int64 (ms): ", median_time * 1e3)

#####################
# Set array elements (fill)

setup = """
gc.enable()
import numpy as np

a = np.zeros(10**7, dtype=np.{})
"""

tt = timeit.Timer('a[:] = 1', setup=setup.format("int8"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} fill-ordered-int8 (ms): ", median_time * 1e3)

tt = timeit.Timer('a[:] = 1', setup=setup.format("int64"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} fill-ordered-int64 (ms): ", median_time * 1e3)

#####################
# Set array elements (random)

setup = """
gc.enable()
import numpy as np

inds = np.arange(10**7)
np.random.shuffle(inds)
a = np.zeros(10**7, dtype=np.{})
"""

tt = timeit.Timer('a[inds] = 1', setup=setup.format("int8"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} fill-random-int8 (ms): ", median_time * 1e3)

tt = timeit.Timer('a[inds] = 1', setup=setup.format("int64"))
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} fill-random-int64 (ms): ", median_time * 1e3)