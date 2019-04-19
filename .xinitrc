setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle" &
termite &
firefox &         
subl3 &
telegram-desktop &
thunar &
xrandr --dpi 220 --output DP-0 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-0 --off &
compton --vsync opengl &
exec i3
xset s off
xset -dpms
xset s noblank
exec dbus-launch
#exec gnome-session
#exec startxfce4
