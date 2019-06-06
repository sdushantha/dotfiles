
<h1 align="center">dotfiles ♥ ~/</h1>

![preview](https://user-images.githubusercontent.com/27065646/59027564-9a144f80-8859-11e9-8eee-5f5c18759c97.png)

---

## Have any questions?
Dont hesitate to ask a a question. Like they say, there is no stupid question, only a stupid answer 😊

Just create an issue or email me → siddharth.dushantha[at]gmail[dot]com

## How to install the dotfiles?
I use ```stow``` to manage my dotfiles.
To install all of them, just run:
```bash
[~/dotfiles]$ # First delete the READEME.md because you dont want that :P
[~/dotfiles]$ rm README.md
[~/dotfiles]$ stow *
```

If you want the config of just one program (e.g ```mpv```), just run:
```bash
[~/dotfiles]$ stow mpv
```
**Note:** Some of the keybindings in the i3 config needs some scripts. You can find them in [this repo](https://github.com/sdushantha/bin).


## Explaination
- **.Xmodmap** <br>This file lets me have natural scrolling on MacBookAir.

- **.i3status.conf** <br>I use polybar but have configuration for the i3bar incase I want to switch back![i3status](https://user-images.githubusercontent.com/27065646/45798078-c3c81f00-bca8-11e8-91f2-a860ba30fa77.png)


- **.bashrc** <br> Contains my config for the bash shell. It also contains some aliases which I find usefull

- **~/script/term.py** <br> Is a very usefull script. I have a keyboard shortcut (```mod+enter```) which runs this script. What this script does is that if the currect workspace is empty, then it will open my terminal which ```kitty``` as floating enabled. If there is a window in the current workspace, then the terminal will open like other windows

- **~/script/ranger.py** <br> This script is very similar to ```term.py```, whicih is mentioned above. But instead of having a blank terminal, it opens ```ranger```, which is my main file browser. This script is binded to ```mod+Shift+enter```.

- **~/script/sudoer_lecture.py** <br> Just nice message when you do anything with sudo. To make it run properly, but this
into your ```.bashrc```. 
  ```bash
  alias sudo="python3 ~/scripts/sudoer_lecture.py && sudo"
  ```

  ![sudobee](https://user-images.githubusercontent.com/27065646/54530272-9cfe5300-4982-11e9-80d2-d26209b3b037.png)

- **~/script/sysinfo.sh** <br> A minimal alternative to neofetch I guess
  
  ![sysinfo](https://user-images.githubusercontent.com/27065646/54530295-ac7d9c00-4982-11e9-933a-f9b24c84c862.png)

- **~/.config/rofi/scripts/picker.sh** <br> A rofi emoji picker. It is binded to ```mod+Shift+d``` 

  ![rofi_emoji_picker](https://user-images.githubusercontent.com/27065646/47914882-79d67980-dea1-11e8-83c1-0ce5ba47ad12.png)


- **.ncmpcpp** <br> There are a few conficurations for it. I like all of them and switch between them from time to time 

- **~/.config/**
  - **audacious** <br> Just a simple config to make audacious minimal
  
  - **dunst** <br> Some configuration for my notification deamon that I took from somewhere
  
    ![dunst](https://user-images.githubusercontent.com/27065646/54530323-bc957b80-4982-11e9-9f7c-3f07b5172f62.png)
    
  - **gtk-3.0** <br> Here you will find ```gtk.css``` which adds paddings for vte-based terminal and ```settings.ini``` which setts my gtk theme and the icons
  
  - **i3** <br> Basic configuration for the ```i3-gaps``` window manager. The only keybinding that might be needed to be noted is that ```mod+x``` launches ```betterlockscreen```
  
  - **polybar** <br> In this folder you will find a file called ```config``` which has some neat configurartion and file called ```launch.sh``` which is script which used to start polybar![polybar](https://user-images.githubusercontent.com/27065646/45797876-f9b8d380-bca7-11e8-8435-170f6022a832.png)

  
  - **ranger** <br> Minimal configuration for my cli file manager which also lets view the images in the terminal. But there is a small bug which makes the images sometimes not render properly
  
  - **rofi** <br> A random color scheme which does not really fit the rest the configs. Its better than plain white which is the deafult I guess
  
  - **termite** <br> My termite terminal emulator configuration. The color scheme is the ocean-next color scheme with but the background color is gotton from pywal-web
  
- **etc/X11/xorg.conf.d** <br> This config allows me to just tap on my trackpad instead of clicking it. For this to work, you will need ```libinput```.

- **.vimrc** <br> Just a simple vimrc. Nothing special her.


# Extra

- **WM:** [i3-gaps](https://github.com/Airblader/i3)

- **Terminal:** kitty

- **Shell:** bash

- **Fonts:** Hack, Font Awesome

- **Color scheme:** [Ocean Next Theme](https://github.com/voronianski/oceanic-next-color-scheme)

- **Theme:** [Arc-Dark](https://github.com/horst3180/Arc-theme)

- **Icons:** [Paper](https://www.snwh.org/paper)

- **Music Player:** ncmpcpp

- **Text editor:** VIM

- **File explorer:** ranger and sometimes Thunar

- **Image viewer:** mpv

- **Program launcher:** rofi

- **Wallpaper handler:** feh

## TODO
---
**Image preview of screenshot using dunst**

I asked on Reddit. Still waiting for a reply...

Would be cool to have it similar to MacOS
```bash
#!/bin/bash
file="/home/zsucrilhos/Screenshots/screenshot_$(date "+%Y-%m-%d_%H-%M-%S").png"
maim -u -f png $file
dunstify -u critical -i $file "System" "Screenshot saved!"
xclip -selection c -t "image/png" -i $file
```

> If the icon is too large, you can adjust the max icon size in your Dunst config.


