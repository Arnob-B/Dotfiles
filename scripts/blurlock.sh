#! /bin/bash

# Take fullscreen screenshot with Flameshot and save to temp file
flameshot full -r > /tmp/screen_locked.png

# Blur the screenshot using ffmpeg (Gaussian blur)
ffmpeg -i /tmp/screen_locked.png -vf "gblur=sigma=10" /tmp/screen_locked_blur.png -y

# Lock with blurred image
i3lock -i /tmp/screen_locked_blur.png -e -f
