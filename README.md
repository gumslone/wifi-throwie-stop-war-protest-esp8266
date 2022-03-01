# wifi-throwie-stop-war-protest-esp8266
an ESP8266/ESP8285 based digital protest throwie

How does it work?

It creates an unprotected wifi ap of your desired name and routes all the traffic when the user connects to the ap to the index.htm file. 
When user clicks some area on the page the audio.mp3 will play.

Whats required?

Any esp8266 or 8285 module (I recommend to use NodeMcu or WeMos development boards for unexpirienced users).
Development boards are easy to flash/program and can be powered from USB interface directly.

How to set it up?

First flash the firmware.bin binary file with esptool.py

install the python esptool.py package from here https://github.com/espressif/esptool
instructions for windows users: https://cyberblogspot.com/how-to-install-esptool-on-windows-10/

Your dev board will have two buttons, a flash and a reset button. 

Connect your ESP8266 to your computer.

Put your board into a flash mode:
Hold the flash button and hit thee reset button, then release the flash button.


for ESP8285 use command like this:

```esptool.py --port=/dev/usbport  write_flash -fm dout 0x00000 ./path/firmware/firmware.bin```

for ESP8266 you can use command like this:

```esptool.py --port=/dev/usbport  write_flash 0x00000 ./path/firmware/firmware.bin```

once its flashed hit the reset button and upload the files from the files folder. 
