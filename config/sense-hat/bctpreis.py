
from sense_hat import SenseHat
import ystockquote
sense = SenseHat()
while true:
    try:
        tickerSymbol = 'BTCUSD=X'
        allInfo = ystockquote.get_all(tickerSymbol)
        sense.show_message("BTC Price = " + allInfo["price"], text_colour=[255, 255, 255], back_colour=[255, 215, 0])
   except:
sense.show_message("unable to get price feed")
