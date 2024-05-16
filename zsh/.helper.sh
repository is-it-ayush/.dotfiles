# ffmpeg util to convert webm to mp4
function webm2mp4() {
    filename="${1%.*}"
    outputname="$filename.mp4"
    if test -f "$1"; then
        printf "You chose the file: $1 \nWe'll use the name '$filename' to save it to $outputname in a moment.\n"
        if test -f $outputname; then
            while true; do
                read -r -p "$outputname exists, would you like to overwrite? (Y/N): " answer
                case $answer in
                    [Yy]* ) ffmpeg -i "$1" -filter:v "scale=trunc(iw/2)*2:trunc(ih/2)*2,fps=30" -codec:v "libx264" "$filename".mp4; break;;
                    [Nn]* ) printf "Not Overwriting. Please rename your file, if necessary. Exiting...\n"; return;;
                    * ) echo "Please answer Y or N.";;
                esac
            done
        elif ! test -f "$outputname"; then
            printf "$outputname does not exist, nothing to worry about overwriting -- rendering now via ffmpeg.\n"
            ffmpeg -i "$1" -filter:v "scale=trunc(iw/2)*2:trunc(ih/2)*2,fps=30" -codec:v "libx264" "$filename".mp4;
        fi
    elif ! test -f "$1"; then
        printf "The file does not exist.\n"
    fi
}

# helper functions to start the appimages in the background.
# does so by piping the output to /dev/null
# takes in a --debug arg to not pipe the output to null.
function freecad() {
  if [ -z "/usr/bin/freecad.appimage" ]; then
    echo "FreeCAD is not installed. You gotta install it first. The binary should be present in /usr/bin/"
  else
    chmod +x /usr/bin/freecad.appimage
    if [[ "$1" == "--debug" ]]; then
      /usr/bin/freecad.appimage
    else
      echo 'starting FreeCAD in the background! :3'
      nohup /usr/bin/freecad.appimage > /dev/null 2>&1 &
    fi
  fi
}
function obsidian() {
  if [ -z "/usr/bin/obsidian.appimage" ]; then
    echo "Obsidian is not installed. You gotta install it first. The binary should be present in /usr/bin/"
  else
    chmod +x /usr/bin/obsidian.appimage
        if [[ "$1" == "--debug" ]]; then
      /usr/bin/obsidian.appimage
    else
      echo 'starting Obsidian in the background! :3'
      nohup /usr/bin/obsidian.appimage > /dev/null 2>&1 &
    fi
  fi
}
function fritzing() {
  if [ -z "/usr/bin/fritzing.appimage" ]; then
    echo "Fritzing is not installed. You gotta install it first. The binary should be present in /usr/bin/"
  else
    chmod +x /usr/bin/fritzing.appimage
        if [[ "$1" == "--debug" ]]; then
      /usr/bin/fritzing.appimage
    else
      echo 'starting Fritzing in the background! :3'
      nohup /usr/bin/fritzing.appimage > /dev/null 2>&1 &
    fi
  fi
}
