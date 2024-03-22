from random import randint
from random import seed

seed()

for number in range(1, 9):
    for letter in ("a", "b", "c", "d", "e", "f", "g", "h"):
        print("." + letter + str(number) + "=" + str(randint(0, 1)) + ",")
