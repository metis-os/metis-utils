#!/usr/bin/env bash

## Copyright (C) 2021-2022 Nabeen Tiwaree <iym.nabeen@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU GPL.V3

#dir definations
PKGDIR=~/projects/metis/metis-repo/
dir_check(){
	if [[ ! -d "$PKGDIR" ]]; then
		mkdir -p "$PKGDIR"
	fi
}

build_pkg(){
    cd metis-dmenu && makepkg -s && mv *.pkg.tar.zst "$PKGDIR" && rm -rf src pkg
    cd ../metis-slstatus && makepkg -s && mv *.pkg.tar.zst "$PKGDIR" && rm -rf src pkg
    cd ../metis-st && makepkg -s && mv *.pkg.tar.zst "$PKGDIR" && rm -rf src pkg
    cd ../metis-nvim && makepkg -s && mv *.pkg.tar.zst "$PKGDIR" && rm -rf src pkg 

}
dir_check
build_pkg && echo -e "*.......PKGS BUILT SUCCESSFULLY.......*" || echo -e "*.......ERROR occured.......*"

