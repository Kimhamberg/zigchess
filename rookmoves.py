def generate_north_rays():
    north_rays = []
    for square in range(64):
        north_ray = [0] * 64
        if square > 7:
            for north in range(-8, -64, -8):
                if (iRay := square + north) < 0:
                    break
                north_ray[iRay] = 1
        north_rays.append("0b" + "".join(str(bit) for bit in north_ray))
    return north_rays


def generate_south_rays():
    south_rays = []
    for square in range(64):
        south_ray = [0] * 64
        if square < 56:
            for south in range(8, 64, 8):
                if (iRay := square + south) > 63:
                    break
                south_ray[iRay] = 1
        south_rays.append("0b" + "".join(str(bit) for bit in south_ray))
    return south_rays


def generate_east_rays():
    east_rays = []
    for square in range(64):
        east_ray = [0] * 64
        if (square + 1) % 8 != 0:
            for east in range(1, 8, 1):
                if (iRay := square + east) % 8 == 0:
                    break
                east_ray[iRay] = 1
        east_rays.append("0b" + "".join(str(bit) for bit in east_ray))
    return east_rays


def generate_west_rays():
    west_rays = []
    for square in range(64):
        west_ray = [0] * 64
        if square % 8 != 0:
            for west in range(-1, -8, -1):
                if (iRay := square + west) % 8 == 0:
                    west_ray[iRay] = 1
                    break
                west_ray[iRay] = 1
        west_rays.append("0b" + "".join(str(bit) for bit in west_ray))
    return west_rays


print(generate_east_rays())
print(generate_north_rays())
print(generate_south_rays())
print(generate_west_rays())
