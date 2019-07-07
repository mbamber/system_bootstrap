function get_datetime() {
    format="%D{%F %T}"
    echo "${format}"
}

function get_pwd() {
    curr_dir="%B%3~%b"
    echo "${curr_dir}"
}

# echo a color code to use depending if the last system call was ok
function color_code() {
    GREEN="%{$fg[green]%}"
    RED="%{$fg[red]%}"
    echo "%(0?-${GREEN}-${RED})"
}

function reset_color() {
    echo "%{$reset_color%}"
}

PROMPT="[$(get_datetime)] $(color_code)$(get_pwd)$(reset_color) \$ "
