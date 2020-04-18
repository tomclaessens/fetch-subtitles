#!/bin/bash

# fetch subtitles
python fetch-subtitles.py

source_dir=.
export_dir=./export

# merge movie file and subtitle
merge_movie_and_subtitle () {
	ffmpeg -i "$source_dir/$1" -f srt -i "${1%.*}.$2.srt" -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt  "$export_dir/${1%.*}.mkv"
}

cleanup () {
	rm *.mkv *.mp4 *.srt *.dbm *.lock
}

# loop movie files
for movie in $source_dir/*.{mp4,mkv}; do
	movie_filename=$(basename -- "$movie")
	filename="${movie_filename%.*}"

	if [[ -f "$source_dir/$filename.en.srt" ]]; then
		merge_movie_and_subtitle "$movie_filename" "en"
	elif [[ -f "$source_dir/$filename.nl.srt" ]]; then
		merge_movie_and_subtitle "$movie_filename" "nl"
	fi
done

cleanup