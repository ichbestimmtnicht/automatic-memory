# import libraries for Sense HAT, delays, and choosing random letters
from sense_hat import SenseHat
from time import sleep
from random import choice

sense = SenseHat() # initialise Sense HAT

w = (0, 0, 0) # set background color to off
l = (255, 255, 255) # set color of letters to white
b = (0, 70, 150) # set driedel color to blue

# creates an array of pixels for the nun
nun = [ 
    w, w, w, b, b, w, w, w,
    w, w, w, b, b, w, w, w,
    b, b, l, l, l, b, b, b,
    b, b, b, b, l, b, b, b,
    b, b, b, b, l, b, b, b,
    b, b, b, b, l, b, b, b,
    w, b, l, l, l, b, b, w,
    w, w, w, b, b, w, w, w,
]

# creates an array of pixels for the gimmel
gimmel = [
    w, w, w, b, b, w, w, w,
    w, w, w, b, b, w, w, w,
    b, b, l, l, l, b, b, b,
    b, b, b, b, l, b, b, b,
    b, b, b, b, l, b, b, b,
    b, b, b, l, l, b, b, b,
    w, b, l, b, l, b, b, w,
    w, w, w, b, b, w, w, w,
]

# creates an array of pixels for the hey
hey = [
    w, w, w, b, b, w, w, w,
    w, w, w, b, b, w, w, w,
    b, b, l, l, l, l, b, b,
    b, b, b, b, b, l, b, b,
    b, b, l, b, b, l, b, b,
    b, b, l, b, b, l, b, b,
    w, b, l, b, b, l, b, w,
    w, w, w, b, b, w, w, w,
]

# creates an array of pixels for the shin
shin = [
    w, w, w, b, b, w, w, w,
    w, w, w, b, b, w, w, w,
    b, l, b, l, b, l, b, b,
    b, l, b, l, b, l, b, b,
    b, l, b, l, b, l, b, b,
    b, l, b, l, b, l, b, b,
    w, l, l, l, l, l, b, w,
    w, w, w, b, b, w, w, w,
]

# create a list of the letters to choose from
letters = [nun, gimmel, hey, shin]

# our main code loop to run forever
while True:
    x, y, z = sense.get_accelerometer_raw().values() # capture the data from the accelerometer in x, y, and z coordinates
    x = abs(x) # make the coordinates positive numbers  
    y = abs(y) # with absolute value, the distance 
    z = abs(z) # between a number and zero
    if x > 2 or y > 2 or z > 2: # check to see if the Raspberry Pi was shaken
        for a in range(10): # scroll through the letters 10 times
            sense.set_pixels(nun)
            sleep(.07)
            sense.set_pixels(gimmel)
            sleep(.07)
            sense.set_pixels(hey)
            sleep(.07)
            sense.set_pixels(shin)
            sleep(.07)
        result = choice(letters) # choose a random letter
sense.set_pixels(result) # display the random letter
