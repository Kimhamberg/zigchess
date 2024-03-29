from numpy import asarray
from dis import dis

l = [1, 2, 3, 4, 5, 6, 7, 8]


def fn():
    return l[1] + l[2]


print(dis(fn))
