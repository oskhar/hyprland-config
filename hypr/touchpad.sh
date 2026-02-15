#!/usr/bin/env bash
set -eou pipefail

HYPR_TPNAME=$(hyprctl devices | grep touchpad | sed -e 's/\s*//')
STATE_FILE="/tmp/hypr_touchpad_state"

create_state_file() {
    if [ ! -f $STATE_FILE ]
    then
        touch /tmp/hypr_touchpad_state
    fi
}

touchpad_toggle () {
    if [[ $(cat $STATE_FILE) == "enabled" || $(cat $STATE_FILE) == "" ]]; then
        # hyprctl keyword "device:$HYPR_TPNAME:enabled" false
        sed  -i -e  '0,/TOUCH_STATE\ =\ 1/{s/TOUCH_STATE\ =\ 1/TOUCH_STATE\ =\ 0/}' $HOME/.config/hypr/hyprland.conf
        echo "disabled" > $STATE_FILE
        notify-send -t 3000 "Touchpad Disabled"
    elif [[ $(cat $STATE_FILE) == "disabled" ]]; then
        # hyprctl keyword "device:$HYPR_TPNAME:enabled" true
        sed  -i -e  '0,/TOUCH_STATE\ =\ 0/{s/TOUCH_STATE\ =\ 0/TOUCH_STATE\ =\ 1/}' $HOME/.config/hypr/hyprland.conf
        echo "enabled" > $STATE_FILE
        notify-send -t 3000 "Touchpad Enabled"
    fi
}

create_state_file
touchpad_toggle
