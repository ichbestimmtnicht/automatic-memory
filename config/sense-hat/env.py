from sense_hat import SenseHat
sense = SenseHat()

while True:
    t = sense.get_temperature()
    p = sense.get_pressure()
    h = sense.get_humidity()

    t = round(t, 1)
    p = round(p, 1)
    h = round(h, 1)

    msg = "Temperatur: {0}Grad-Celsius  Luftdruck: {1}hPa, Luftfeuchtigkeit: {2}%".format(t,p,h)

    sense.show_message(msg, scroll_speed=0.125)
