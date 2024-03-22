def forwardMoves():
    forwards = []
    for square in range(64):
        forward = [0] * 64
        if square > 7:
            if 47 < square and square < 56:
                forward[square - 16] = 1
            else:
                forward[square - 8] = 1
        forwards.append("0b" + "".join(str(bit) for bit in forward))
    return forwards


#  0  1  2  3  4  5  6  7
#  8  9 10 11 12 13 14 15
# 16 17 18 19 20 21 22 23
# 24 25 26 27 28 29 30 31
# 32 33 34 35 36 37 38 39
# 40 41 42 43 44 45 46 47
# 48 49 50 51 52 53 54 55
# 56 57 58 59 60 61 62 63


def diagonalMoves():
    diagonals = []
    for square in range(64):
        diagonal = [0] * 64
        if square > 7:
            if square % 8 == 0:
                diagonal[square - 7] = 1
            elif (square + 1) % 8 == 0:
                diagonal[square - 9] = 1
            else:
                diagonal[square - 9] = 1
                diagonal[square - 7] = 1
        diagonals.append("0b" + "".join(str(bit) for bit in diagonal))
    return diagonals


bitboards = diagonalMoves()


def map_to_square(n):
    rank = str((7 - (n // 8)) + 1)
    file = chr((n % 8) + 97)
    return file + rank


for index in range(len(bitboards) - 1, -1, -1):
    print(map_to_square(index) + " * " + bitboards[index] + " | ")
