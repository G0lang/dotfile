#!/bin/bash

dmenu_lines=${CLIPMENU_LINES-8}

declare -A selections

for file in /tmp/clipmenu/*; do
    first_line=$(sed -n '/./{p;q}' "$file")

    lines=$(wc -l "$file")
    lines=${lines%% *}

    if (( lines > 1 )); then
        first_line+=" ($lines lines)"
    fi

    selections[$first_line]=$file
done

chosen_line=$(printf '%s\n' "${!selections[@]}" | dmenu -l "$dmenu_lines" "$@")

[[ $chosen_line ]] || exit 1

for selection in clipboard primary; do
    if type -p xsel >/dev/null 2>&1; then
        xsel --"$selection" < "${selections[$chosen_line]}"
    else
        xclip -sel "$selection" < "${selections[$chosen_line]}"
    fi
done