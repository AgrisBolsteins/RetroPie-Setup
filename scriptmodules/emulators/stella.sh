#!/usr/bin/env bash

# This file is part of RetroPie.
# 
# (c) Copyright 2012-2015  Florian Müller (contact@petrockblock.com)
# 
# See the LICENSE.md file at the top-level directory of this distribution and 
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="stella"
rp_module_desc="Atari2600 emulator STELLA"
rp_module_menus="2+"
rp_module_flags="dispmanx nobin"

function install_stella()
{
    [[ "$__raspbian_ver" == "7" ]] && aptInstall stella
}

function configure_stella() {
    [[ "$__raspbian_ver" != "7" ]] && return

    mkRomDir "atari2600"

    setDispmanx "$md_id" 1

    delSystem "$md_id" "atari2600-stella"
    addSystem 0 "$md_id" "atari2600" "stella -maxres 320x240 %ROM%"
}
