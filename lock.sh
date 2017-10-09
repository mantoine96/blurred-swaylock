#!/bin/bash

# swaylock blurred screen inspired by /u/patopop007 and the blog post
# http://plankenau.com/blog/post-10/gaussianlock
# Modified from gist https://gist.github.com/csivanich/10914698

# Dependencies:
# imagemagick
# swaylock
# swaygrab

IMAGE=/tmp/swaylock.png
SCREENSHOT="swaygrab $IMAGE"

# Alternate screenshot method with imagemagick. NOTE: it is much slower
# SCREENSHOT="import -window root $IMAGE" # 1.35s

# Here are some imagemagick blur types
# Uncomment one to use, if you have multiple, the last one will be used

# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5"
#BLURTYPE="0x2"
#BLURTYPE="5x2"
#BLURTYPE="2x8"
#BLURTYPE="2x3"
BLURTYPE="0x6"
# Get the screenshot, add the blur and lock the screen with it
$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE
swaylock -i $IMAGE
rm $IMAGE
