def knight_moves():
    board_size = 8
    bitboards = []
    directions = [
        (2, 1),
        (1, 2),
        (-1, -2),
        (-2, -1),
        (-2, 1),
        (-1, 2),
        (1, -2),
        (2, -1),
    ]

    def is_valid(x, y):
        return 0 <= x < board_size and 0 <= y < board_size

    for i in range(board_size):
        for j in range(board_size):
            bit_mask = 0
            for dx, dy in directions:
                new_x, new_y = i + dx, j + dy
                if is_valid(new_x, new_y):
                    bit_pos = new_x * board_size + new_y
                    bit_mask |= 1 << (63 - bit_pos)
            bitboards.append(bit_mask)
    return list(bitboards)


bitboards = knight_moves()


def map_to_square(n):
    rank = str((7 - (n // 8)) + 1)
    file = chr((n % 8) + 97)
    return file + rank


# for index in range(len(bitboards) - 1, -1, -1):
#     print(map_to_square(index) + " * " + str(bitboards[index]) + " | ")

# for index in range(len(bitboards) - 1, -1, -1):
#     print(
#         "const "
#         + map_to_square(index)
#         + ": u64 = knightBoard."
#         + map_to_square(index)
#         + ";"
#     )

print(2**18 + 2**16 + 2**21 + 2**23)
