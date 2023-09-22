# AUDIO Convert all wav files to mp3
# For multiple file types : find . -name *.wav -or -name *.wma -exec ffmpeg -i {} {}.mp3 \;
# -y : overwrites existing
# -i : input fule
# -vn : Disable video, to make sure no video (including album cover image) is included if the source would be a video file
# -ar - Set the audio sampling frequency. For output streams it is set by default to the frequency of the corresponding input stream. For input streams this option only makes sense for audio grabbing devices and raw demuxers and is mapped to the corresponding demuxer options.
# -ac - Set the number of audio channels. For output streams it is set by default to the number of input audio channels. For input streams this option only makes sense for audio grabbing devices and raw demuxers and is mapped to the corresponding demuxer options. So used here to make sure it is stereo (2 channels)
# -qscale:a 0 - Quality: VBR 320kbit/s; see https://trac.ffmpeg.org/wiki/Encode/MP3
find . -name *.wav -exec ffmpeg -y -i {} -vn -ar 44100 -ac 2 -qscale:a 0 {}.mp3 \;
