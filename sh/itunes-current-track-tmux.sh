#!/usr/bin/env bash
ITUNES_TRACK=$(osascript <<EOF
if appIsRunning("Spotify")
    tell app "Spotify" to get the name of the current track
else if appIsRunning("iTunes") then
    tell app "iTunes" to get the name of the current track
end if

on appIsRunning(appName)
    tell app "System Events" to (name of processes) contains appName
end appIsRunning
EOF)

if test "x$ITUNES_TRACK" != "x"; then
ITUNES_ARTIST=$(osascript <<EOF
if appIsRunning("Spotify")
    tell app "Spotify" to get the artist of the current track
else if appIsRunning("iTunes") then
    tell app "iTunes" to get the artist of the current track
end if


on appIsRunning(appName)
    tell app "System Events" to (name of processes) contains appName
end appIsRunning
EOF)

    echo '#[fg=green,bg=black]⮃#[bg=black,fg=brightred,bold] ♪♪' $ITUNES_TRACK '#[nobold]===#[nobold]' $ITUNES_ARTIST '#[fg=brightblue,bg=black,nobold]'
fi
