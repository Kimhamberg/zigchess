from dis import dis


def f(a: int) -> int:
    return a > 0


print(dis(f))
