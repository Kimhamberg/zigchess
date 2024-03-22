from random import randint
from random import seed

# seed()

# for number in range(1, 9):
#     for letter in ("h", "g", "f", "e", "d", "c", "b", "a"):
#         print(letter + str(number) + ": u1,")


# for number in range(1, 9):
#     for letter in ("h", "g", "f", "e", "d", "c", "b", "a"):
#         print("." + letter + str(number) + " = " + str(randint(0, 1)) + ",")

for number in range(1, 9):
    for letter in ("h", "g", "f", "e", "d", "c", "b", "a"):
        print(
            "try expect(board1."
            + letter
            + str(number)
            + " & board2."
            + letter
            + str(number)
            + " == board3."
            + letter
            + str(number)
            + ");"
        )
