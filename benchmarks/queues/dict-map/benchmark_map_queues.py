from collections import defaultdict
import timeit
import time
import gc
import numpy as np
import heapq

platform = "dict"

def build_dict(N, q_max=365*10):
    h = defaultdict(list)
    for i in range(N):
        h[i].append(np.random.randint(1, q_max, 1)[0])
    return h

######################
# Build queue
n_run = 100

setup = """
gc.enable()
import numpy as np
from collections import defaultdict

def build_dict(N, q_max=365*10):
    h = defaultdict(list)
    for i in range(N):
        h[i].append(np.random.randint(1, q_max, 1)[0])
    return h
"""

tt = timeit.Timer('build_dict(10**3)', setup=setup.format())
a = tt.repeat(n_run, 1)
median_time = sorted(a)[n_run // 2 + n_run % 2]
print(f"{platform} build (ms): ", median_time * 1e3)

######################
# Pop queue
n_run = 10
t = []
for i in range(n_run):
    h = build_dict(10**5)
    start_time = time.perf_counter()
    k = min(h.keys())
    p = h[k]
    cnt = 0
    for p_ in p:
        cnt += 1
    del h[k]
    end_time = time.perf_counter()
    t.append(end_time - start_time)
median_time = sorted(t)[n_run // 2 + n_run % 2]
print(f"{platform} pop (ms): ", median_time * 1e3)

######################
# Pop all
n_run = 2
t = []
for i in range(n_run):
    h = build_dict(10**5)
    start_time = time.perf_counter()
    while h:
        k = min(h.keys())
        p = h[k]
        cnt = 0
        for p_ in p:
            cnt += 1
        del h[k]
    end_time = time.perf_counter()
    t.append(end_time - start_time)
median_time = sorted(t)[n_run // 2 + n_run % 2]
print(f"{platform} deplete (ms): ", median_time * 1e3)
