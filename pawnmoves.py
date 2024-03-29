def whitePawnPushes():
    forwards = []
    for square in range(64):
        forward = [0] * 64
        if 7 < square < 56:
            if 47 < square and square < 56:
                forward[square - 16] = 1
                forward[square - 8] = 1
            else:
                forward[square - 8] = 1
        forwards.append(int("".join(str(bit) for bit in forward), 2))
    return list(reversed(forwards))


def blackPawnPushes():
    forwards = []
    for square in range(64):
        forward = [0] * 64
        if 7 < square < 56:
            if 7 < square and square < 16:
                forward[square + 16] = 1
                forward[square + 8] = 1
            else:
                forward[square + 8] = 1
        forwards.append(int("".join(str(bit) for bit in forward), 2))
    return list(reversed(forwards))


def whitePawnCaptures():
    diagonals = []
    for square in range(64):
        diagonal = [0] * 64
        if 7 < square < 56:
            if square % 8 == 0:
                diagonal[square - 7] = 1
            elif (square + 1) % 8 == 0:
                diagonal[square - 9] = 1
            else:
                diagonal[square - 9] = 1
                diagonal[square - 7] = 1
        diagonals.append(int("".join(str(bit) for bit in diagonal), 2))
    return list(reversed(diagonals))


#  0  1  2  3  4  5  6  7
#  8  9 10 11 12 13 14 15
# 16 17 18 19 20 21 22 23
# 24 25 26 27 28 29 30 31
# 32 33 34 35 36 37 38 39
# 40 41 42 43 44 45 46 47
# 48 49 50 51 52 53 54 55
# 56 57 58 59 60 61 62 63


def blackPawnCaptures():
    diagonals = []
    for square in range(64):
        diagonal = [0] * 64
        if 7 < square < 56:
            if square % 8 == 0:
                diagonal[square + 9] = 1
            elif (square + 1) % 8 == 0:
                diagonal[square + 7] = 1
            else:
                diagonal[square + 7] = 1
                diagonal[square + 9] = 1
        diagonals.append(int("".join(str(bit) for bit in diagonal), 2))
    return list(reversed(diagonals))


print(whitePawnPushes())
print(whitePawnCaptures())
print(blackPawnPushes())
print(blackPawnCaptures())
