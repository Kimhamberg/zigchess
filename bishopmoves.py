def generate_north_west_rays():
    north_west_rays = []
    for square in range(64):
        north_west_ray = [0] * 64
        if square > 7 and square % 8 != 0:
            for north_west in range(-9, -72, -9):
                if (iRay := square + north_west) < 0:
                    break
                if iRay % 8 == 0:
                    north_west_ray[iRay] = 1
                    break
                north_west_ray[iRay] = 1
        north_west_rays.append("0b" + "".join(str(bit) for bit in north_west_ray))
    return north_west_rays


def generate_north_east_rays():
    north_east_rays = []
    for square in range(64):
        north_east_ray = [0] * 64
        if square > 7 and square + 1 % 8 != 0:
            for north_east in range(-7, -56, -7):
                if (iRay := square + north_east) < 0 or iRay % 8 == 0:
                    break
                north_east_ray[iRay] = 1
        north_east_rays.append("0b" + "".join(str(bit) for bit in north_east_ray))
    return north_east_rays


def generate_south_west_rays():
    south_west_rays = []
    for square in range(64):
        south_west_ray = [0] * 64
        if square < 56 and square % 8 != 0:
            for north_east in range(7, 56, 7):
                if (iRay := square + north_east) > 63:
                    break
                if iRay % 8 == 0:
                    south_west_ray[iRay] = 1
                    break
                south_west_ray[iRay] = 1
        south_west_rays.append("0b" + "".join(str(bit) for bit in south_west_ray))
    return south_west_rays


def generate_south_east_rays():
    south_east_rays = []
    for square in range(64):
        south_east_ray = [0] * 64
        if square < 56 and square + 1 % 8 != 0:
            for north_east in range(9, 72, 9):
                if (iRay := square + north_east) > 63 or iRay % 8 == 0:
                    break
                south_east_ray[iRay] = 1
        south_east_rays.append("0b" + "".join(str(bit) for bit in south_east_ray))
    return south_east_rays
