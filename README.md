# gif_snapshot
A one-button tool for recording your screen to a GIF

## What is this for?
Have you ever wanted to take a quick video of your screen and instantly save it as a GIF, with **only one button press**? Look no further!
*"But mate, why would I wanna do that"*
Perspicacious question! Here's some use cases:
- You're playing a game and you absolutely have to send your stupid shenanigans to everyone on your Discord groups. Send them all a GIF snapshot and get yelled at!
- You're playing a space sim with your new friend and he has no idea where to find his orbital flight controls among the 34 nested menus. Send him a GIF snapshot, then yell at him!
- You're playing a game riddled with technical bugs, your co-op mate is waiting for you to activate the Mega Tower but for some reason you can't find it. Send him a GIF snapshot and find out that the tower does NOT show up in your game instance!

And here's some eye candy to get you hooked:

![](https://github.com/Cy-r0/gif_snapshot/blob/master/media/30-03-20_153006.gif)
Perfect landing in Elite Dangerous
![](https://github.com/Cy-r0/gif_snapshot/blob/master/media/01-04-20_163127.gif)
How to google stuff
![](https://github.com/Cy-r0/gif_snapshot/blob/master/media/01-04-20_101432.gif)
"Only the best rally game ever made"


## How do I get it?
Here's the step-by-step instructions to get it running (WARNING, this is for **Windows 10** only):

- Install **imagemagick** for Windows from [here](https://imagemagick.org/script/download.php#windows);
- Clone this repository by entering `git clone https://github.com/Cy-r0/gif_snapshot/` in your terminal, or just press the green button that says "Clone or Download" in the top-right corner of the Github page and download a .zip if you don't know what a terminal is. You can put this repository in any folder you like;
- Execute *gif_snapshot.exe*, or, if you don't trust it, read through *gif_snapshot.ahk* yourself, then download AutoHotKey from [here](https://https://www.autohotkey.com/) and run it.

**Optional**:
This script will stop running if you shutdown or restart your pc. If you want it to always be on:
- Press Win + R;
- Type `shell:startup` and the startup directory will open;
- Right-click *gif_snapshot.exe*, select "Copy", left-click into the startup folder, select "Paste shortcut".


## Usage
- Press the *Print Screen* button on your keyboard. You'll hear a sound meaning that recording has started;
- After 7 seconds you'll hear another sound, meaning that recording has stopped and the GIF is being generated;
- After another 5ish seconds, you'll hear a third sound, meaning that your GIF has been generated and can be found in the *gifs* directory inside the repository (that directory doesn't exist yet, but it will be automatically generated when the time comes).


## Specs
The GIFs generated by the script are **7 seconds** long at **6.67 fps**, with a resolution of **640x360 px** and a bit-depth of 5. These settings strike a good balance between GIF generation time, CPU load and image quality, and can't be changed unless you edit the script yourself. 
Also, Discord has a pretty small max attachment size of **8 MB** so it's going to be difficult to increase duration, fps or resolution of the GIF without exceeding this.
Also also, if you have a **21:9 monitor**, the script **will cut away the side bars** so that the final GIF is 16:9. This probably doesn't make a lot of sense at first glance, but in GIFs instant understanding is of paramount importance. 21:9 is simply too long and thin and it results in the GIF being harder to understand immediately compared to a 16:9 GIF.


## Acknowledgements
Sincere thanks to tic (Tariq Porter) for his most excellent AutoHotKey GDI+ Library (ahkscript.org/boards/viewtopic.php?t=6517).
