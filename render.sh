set -e
mkdir -p output
octave animation.m
octave audio.m
ffmpeg -framerate 60 -i "output/%04d.png" -i "output/audio.wav" -y animation.mpeg -loglevel 0
