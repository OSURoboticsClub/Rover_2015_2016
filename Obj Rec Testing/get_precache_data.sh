#!/usr/bin/env sh

mkdir precache_data
cd precache_data
wget -O images https://www.dropbox.com/sh/10kopnrspco85tw/AACa1y6pFcSbcahiINE7w5efa?dl=1
unzip images
rm images
