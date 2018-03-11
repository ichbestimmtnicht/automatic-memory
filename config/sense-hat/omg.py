from sense_hat import SenseHat
from time import sleep
from random import randint

sense = SenseHat()

r = randint(0,255)
sense.show_letter("O", (r, 0, 0))
sleep(1)

r = randint(0,255)
sense.show_letter("M", (0, 0, r))
sleep(1)

r = randint(0,255)
sense.show_letter("G", (0, r, 0))
sleep(1)

sense.show_letter("!", (0, 0, 0), (255, 255, 255))
sleep(1)
sense.clear()
