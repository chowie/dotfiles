#!/usr/bin/env bash

# ====================CONFIG THIS =============================== #
COLOR_01="#6e5346"           # HOST
COLOR_02="#e35b00"           # SYNTAX_STRING
COLOR_03="#5cab96"           # COMMAND
COLOR_04="#e3cd7b"           # COMMAND_COLOR2
COLOR_05="#0f548b"           # PATH
COLOR_06="#e35b00"           # SYNTAX_VAR
COLOR_07="#06afc7"           # PROMP
COLOR_08="#f0f1ce"           #

COLOR_09="#684c31"           #
COLOR_10="#ff8a3a"           # COMMAND_ERROR
COLOR_11="#aecab8"           # EXEC
COLOR_12="#ffc878"           #
COLOR_13="#67a0ce"           # FOLDER
COLOR_14="#ff8a3a"           #
COLOR_15="#83a7b4"           #
COLOR_16="#fefff1"           #

BACKGROUND_COLOR="#0a1e24"   # Background Color
FOREGROUND_COLOR="#ecf0c1"   # Text
CURSOR_COLOR="$FOREGROUND_COLOR" # Cursor
PROFILE_NAME="Spacedust"
# =============================================================== #







# =============================================================== #
# | Apply Colors
# ===============================================================|#
function gogh_colors () {
    echo ""
    echo -e "\033[0;30m█████\\033[0m\033[0;31m█████\\033[0m\033[0;32m█████\\033[0m\033[0;33m█████\\033[0m\033[0;34m█████\\033[0m\033[0;35m█████\\033[0m\033[0;36m█████\\033[0m\033[0;37m█████\\033[0m"
    echo -e "\033[0m\033[1;30m█████\\033[0m\033[1;31m█████\\033[0m\033[1;32m█████\\033[0m\033[1;33m█████\\033[0m\033[1;34m█████\\033[0m\033[1;35m█████\\033[0m\033[1;36m█████\\033[0m\033[1;37m█████\\033[0m"
    echo ""
}

function curlsource() {
    f=$(mktemp -t curlsource)
    curl -o "$f" -s -L "$1"
    source "$f"
    rm -f "$f"
}

SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_PATH="$(dirname "$SCRIPT_PATH")"

gogh_colors
if [ -e $PARENT_PATH"/apply-colors.sh" ]; then
    source $PARENT_PATH"/apply-colors.sh"
else
        if [ $(uname) = "Darwin" ]; then
        # OSX ships with curl and ancient bash
        # Note: here, sourcing directly from curl does not work
        curlsource https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh
    else
        # Linux ships with wget
        source <(wget -O - https://raw.githubusercontent.com/Mayccoll/Gogh/master/apply-colors.sh)
    fi
fi
