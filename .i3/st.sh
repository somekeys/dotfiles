#!/bin/bash
#
# i3-status (a wrapper around i3status)

i3status "$@" | while :
do
    read -r line
    wcam=$(lsof /dev/video0 | awk '{print $1}' | grep -v COMMAND | uniq | sed 's/skypeforl*/skype/g')
    wcam=${wcam:-'idle'}
    wmic=$(pactl list sources | grep -A 7  alsa_input.usb-Alcor_Micro__Corp._TeckNet-02.mono-fallback | grep -c 'Mute: no')
    umic=$(pactl list sources | grep -A 7 alsa_input.usb-C-Media_Electronics_Inc._USB_Audio_Device-00 | grep -c 'Mute: no')
    rmic=$(pactl list sources | grep -A 7 alsa_input.pci-0000_00_1b.0.analog-stereo | grep -c 'Mute: no')
    eval "$(xdotool getmouselocation --shell)"
    ccmt='cc offline'
    if [ "$(ping -c 1 -W 1 192.168.1.114 | grep -c "1 received")" -ne 0 ]; then
        ccmt="cc $(ssh cheesecake vcgencmd measure_temp)"
    fi
    echo "| cursor $X $Y | ${ccmt} | webcam ${wcam} | mic ${wmic} ${umic} ${rmic} | ${line}" || exit 1
done

