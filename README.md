# wifi-throwie-stop-war-protest-esp8266
an ESP8266/ESP8285 based digital protest throwie

<b>How does it work?</b>

It creates an unprotected wifi ap of your desired name, when user connects to the AP it shows a captive portal with the index.htm, it also forwards all the traffic to the index.htm file.

When user clicks some area on the page the audio.mp3 will play.

<b>What's required?</b>

Any esp8266 or 8285 module (I recommend to use NodeMcu or WeMos development boards for unexpirienced users).

Development boards are easy to flash/program and can be powered from USB interface directly.

<b>How to set it up?</b>

<b>Flash</b>

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

<b>Upload files</b>

To upload the files you can use the nodemcu-uploader python package https://github.com/kmpm/nodemcu-uploader

Optionaly you can use the ESPlorer tool with UI: https://github.com/4refr0nt/ESPlorer/releases

```nodemcu-uploader --baud 115200 --port /dev/usbport upload ./path/files/*```

Hit reset and the wifi app will start.

If something has gone wrong during your flashing / uploading process, here are the commands to erase flash and delete files.

To erase flash:
```esptool.py --port=/dev/usbport  erase_flash```

To format the file system:
```nodemcu-uploader --baud 115200 --port /dev/usbport file format```

You can edit the index.htm and add your contents to it.

To change the AP name edit the init.lua file.

For the audio file please use texttospeech services like narakeet https://www.narakeet.com/languages/ukrainian-text-to-speech/

Please keep in mind that the module has a limited memory and unable to handle large files.
