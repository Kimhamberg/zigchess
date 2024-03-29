def printBoardIndices():
    for i in range(63, -1, -1):
        if (i + 1) % 8 == 0:
            print("\n")
        print("{:2d} ".format(i), end="")


def generate_north_west_rays():
    north_west_rays = []
    for square in range(63, -1, -1):
        north_west_ray = [0] * 64
        if square > 7 and square % 8 != 0:  # ikke øverst eller på venstre kant
            for north_west in range(-9, -72, -9):
                iRay = square + north_west
                if iRay < 8 or iRay % 8 == 0:
                    north_west_ray[iRay] = 1
                    break
                north_west_ray[iRay] = 1
        north_west_rays.append(int("".join(str(bit) for bit in north_west_ray), 2))
    return north_west_rays


def generate_north_east_rays():
    north_east_rays = []
    for square in range(63, -1, -1):
        north_east_ray = [0] * 64
        if square > 7 and (square + 1) % 8 != 0:  # ikke øverst eller på høyre kant
            for north_west in range(-7, -56, -7):
                iRay = square + north_west
                if iRay < 8 or (iRay + 1) % 8 == 0:
                    north_east_ray[iRay] = 1
                    break
                north_east_ray[iRay] = 1
        north_east_rays.append(int("".join(str(bit) for bit in north_east_ray), 2))
    return north_east_rays


"""
 0  1  2  3  4  5  6  7

 8  9 10 11 12 13 14 15

16 17 18 19 20 21 22 23

24 25 26 27 28 29 30 31

32 33 34 35 36 37 38 39

40 41 42 43 44 45 46 47

48 49 50 51 52 53 54 55

56 57 58 59 60 61 62 63
"""

def generate_south_west_rays():
    south_west_rays = []
    for square in range(63, -1, -1):
        south_west_ray = [0] * 64
        if square < 56 and square % 8 != 0:  # ikke nederst eller på venstre kant
            for south_west in range(7, 56, 7):
                if (iRay := square + south_west) > 63:
                    break
                if iRay % 8 == 0:
                    south_west_ray[iRay] = 1
                    break
                south_west_ray[iRay] = 1
        south_west_rays.append(int("".join(map(str, south_west_ray)), 2))
    return south_west_rays


def generate_south_east_rays():
    south_east_rays = []
    for square in range(63, -1, -1):
        south_east_ray = [0] * 64
        if square < 56 and (square + 1) % 8 != 0:
            for south_east in range(9, 72, 9):
                if (iRay := square + south_east) > 63 or iRay % 8 == 0:
                    break
                south_east_ray[iRay] = 1
        south_east_rays.append(int("".join(map(str, south_east_ray)), 2))
    return south_east_rays

print(generate_north_east_rays())
print(generate_north_west_rays())
print(generate_south_east_rays())
print(generate_south_west_rays())
