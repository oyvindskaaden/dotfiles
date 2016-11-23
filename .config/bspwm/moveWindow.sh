#! /bin/bash



# Selects the 2nd desktop
bspc desktop -f '^1'

# Spawns Programs
#google-chrome &

#./launchSpotify.sh &

# Sleep for windows to appear
sleep 5s

#Moves the content to different desktops
bspc node -d '^2' #Chrome
bspc node -d '^10' #Spotify

# Move back to start window
bspc desktop -f '^1'
