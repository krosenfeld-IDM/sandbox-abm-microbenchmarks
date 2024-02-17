import timeit
import time
import gc
import numpy as np
import heapq


platform = "heapq"

def build_heap(N, q_max=365*10):
    h = []
    for i in range(N):
        heapq.heappush(h, (np.random.randint(1, q_max, 1)[0], i))
    return h

######################
# Build queue
n_run = 100

setup = """
gc.enable()
import numpy as np
import heapq 

def build_heap(N, q_max=365*10):
    h = []
    for i in range(N):
        heapq.heappush(h, (np.random.randint(1, q_max, 1)[0], i))
    return h
"""

tt = timeit.Timer('build_heap(10**3)', setup=setup.format())
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} build (ms): ", median_time * 1e3)

######################
# Pop queue
n_run = 10
t = []
for i in range(n_run):
    h = build_heap(10**5)
    start_time = time.perf_counter()
    p = heapq.heappop(h)
    while p[0] == 1:
        p = heapq.heappop(h)
    heapq.heappush(h, p)
    end_time = time.perf_counter()
    t.append(end_time - start_time)
median_time = sorted(t)[n_run // 2 + n_run % 2]
print(f"{platform} pop (ms): ", median_time * 1e3)

######################
# Pop all
n_run = 10
t = []
for i in range(n_run):
    h = build_heap(10**5)
    start_time = time.perf_counter()
    while len(h) > 0:
        heapq.heappop(h)
    end_time = time.perf_counter()
    t.append(end_time - start_time)
median_time = sorted(t)[n_run // 2 + n_run % 2]
print(f"{platform} deplete (ms): ", median_time * 1e3)
