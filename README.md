# fetch-subtitles

> Fetch subtitles for MKV/MP4 files and merge them to an MKV container

## Description

Currently only MKV/MP4 source files are supported as those are the only format my AVR supports. The shell script calls a python script to download the `en` or `nl` subtitles (English or Dutch).

Once all subtitles are fetched, `ffmpeg` is used to combine the movie files and subtitles into an Matroska container.

## Requirements

This project depends on:

* [python](https://www.python.org/)
* [subliminal](https://pypi.org/project/subliminal/)
* [ffmpeg](https://ffmpeg.org/)

## Usage

1. Add files to the working directory
2. `$ ./fetch-subs-merge-mkv.sh`
3. Once completed all converted MKV containers are in the `./export` folder

## License

MIT © [Tom Claessens](https://tomclaessens.be)
