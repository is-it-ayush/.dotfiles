# ffmpeg util to convert webm to mp4
function webm2mp4() {
    filename="${1%.*}"
    outputname="$filename.mp4"
    if test -f "$1"; then
        printf "you selected the file: $1 \nwe'll use the name '$filename' to save it to $outputname in a moment.\n"
        if test -f $outputname; then
            while true; do
                read -r -p "$outputname exists, would you like to overwrite? (Y/y/N/n): " answer
                case $answer in
                    [Yy]* ) ffmpeg -i "$1" -filter:v "scale=trunc(iw/2)*2:trunc(ih/2)*2,fps=30" -codec:v "libx264" "$filename".mp4; break;;
                    [Nn]* ) printf "not overwriting. please rename your file, if necessary. exiting...\n"; return;;
                    * ) echo "please answer y or n.";;
                esac
            done
        elif ! test -f "$outputname"; then
            printf "$outputname does not exist, nothing to worry about overwriting -- rendering now via ffmpeg.\n"
            ffmpeg -i "$1" -filter:v "scale=trunc(iw/2)*2:trunc(ih/2)*2,fps=30" -codec:v "libx264" "$filename".mp4;
        fi
    elif ! test -f "$1"; then
        printf "the file does not exist.\n"
    fi
}

# helper functions to start the appimages in the background.
# does so by piping the output to /dev/null
# takes in a --debug arg to not pipe the output to null.
# the binaries are still tied to the executing process.
# thus closing the shell will close the appimage.
function freecad() {
  if [ -z "$LOCAL/bin/freecad" ]; then
    echo "FreeCAD is not installed. You gotta install it first. The binary should be present in $LOCAL"
  else
    chmod u+x $LOCAL/bin/freecad
    if [[ "$1" == "--debug" ]]; then
      $LOCAL/bin/freecad
    else
      echo 'starting FreeCAD in the background! :3'
      nohup $LOCAL/bin/freecad > /dev/null 2>&1 &
    fi
  fi
}
function obsidian() {
  if [ -z "$LOCAL/bin/obsidian" ]; then
    echo "Obsidian is not installed. You gotta install it first. The binary should be present in $LOCAL"
  else
    chmod +x $LOCAL/bin/obsidian
    if [[ "$1" == "--debug" ]]; then
      $LOCAL/bin/obsidian
    else
      echo 'starting Obsidian in the background! :3'
      nohup $LOCAL/bin/obsidian > /dev/null 2>&1 &
    fi
  fi
}
function fritzing() {
  if [ -z "$LOCAL/bin/fritzing" ]; then
    echo "Fritzing is not installed. You gotta install it first. The binary should be present in $LOCAL"
  else
    chmod +x $LOCAL/bin/fritzing
    if [[ "$1" == "--debug" ]]; then
      $LOCAL/bin/fritzing
    else
      echo 'starting Fritzing in the background! :3'
      nohup $LOCAL/bin/fritzing > /dev/null 2>&1 &
    fi
  fi
}
