#!/usr/bin/env python3

import time


def catalan(n):
    cat = [0] * (n+1)
    cat[0] = 1
    for i in range(1, n+1):
        for j in range(i):
            cat[i] += cat[j] * cat[i-j-1]
    return cat[n]


def main():
    N = 30  # Calculamos C(0) hasta C(29)
    start_time = time.time()
    for i in range(N):
        print(f"C({i}) = {catalan(i)}")
    end_time = time.time()
    elapsed_ms = (end_time - start_time) * 1000
    print(f"Tiempo de ejecución (en Python): {elapsed_ms:.2f} ms")


if __name__ == "__main__":
    main()
