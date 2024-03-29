def generate_king_moves():
    king_moves = []
    for square in range(64):
        moves = 0
        row, col = square // 8, square % 8

        # Generate possible moves
        for dr in [-1, 0, 1]:
            for dc in [-1, 0, 1]:
                if dr == 0 and dc == 0:
                    continue
                new_row, new_col = row + dr, col + dc
                if 0 <= new_row < 8 and 0 <= new_col < 8:
                    moves |= 1 << (new_row * 8 + new_col)

        king_moves.append(moves)
    return king_moves


print(generate_king_moves())
