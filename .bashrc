. "/home/niels/.local/share/cargo/env"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
# fortune de | lolcat -h 0.3 -v 2
pokeget --hide-name random


# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


#  ____  _           _     
# | __ )(_)_ __   __| |___ 
# |  _ \| | '_ \ / _` / __|
# | |_) | | | | | (_| \__ \
# |____/|_|_| |_|\__,_|___/
                         
# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB:menu-complete'
# And Shift-Tab should cycle backwards
bind '"\e[Z": menu-complete-backward'

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial (common) completion on the first Tab press, only start
# cycling full results on the second Tab press (from bash version 5)
bind "set menu-complete-display-prefix on"

# Cycle through history based on characters already typed on the line
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Keep Ctrl-Left and Ctrl-Right working when the above are used
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'


#     _    _ _                     
#    / \  | (_) __ _ ___  ___  ___ 
#   / _ \ | | |/ _` / __|/ _ \/ __|
#  / ___ \| | | (_| \__ \  __/\__ \
# /_/   \_\_|_|\__,_|___/\___||___/

# file management
alias l="lsd -lA --date relative"
alias ll="lsd -l --date relative"
alias ls="lsd"
alias la="lsd -A"
alias lsa="lsd -A"
alias tree="lsd --tree"
alias md="mkdir -p"
alias rm="trash-put"

# zoxide stuff
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias cd="z"

# wireguard
alias wg-up="sudo wg-quick up wg0"
alias wg-down="sudo wg-quick down wg0"

# python
alias py="python3"
alias venv=". ~/Documents/dev/python-venv/bin/activate"

# downloads
alias mdl="yt-dlp --embed-metadata --embed-thumbnail --embed-chapters -x --audio-format mp3 -f bestaudio -o '%(title)s.%(ext)s'"
alias vdl="yt-dlp --format bestvideo+bestaudio --merge-output-format mkv --embed-subs --embed-metadata --sponsorblock-mark all -N 4 -o '%(title)s.%(ext)s'"
alias spotdl="~/Documents/dev/python-venv/bin/spotdl --preload --format mp3"

# docker
alias kali="docker run --tty --interactive --privileged --rm kalilinux/kali-rolling"
alias alpine="docker run --tty --interactive --privileged --rm alpine"

# power
alias poweroff="loginctl poweroff"
alias reboot="loginctl reboot"
alias zzz="loginctl suspend"
alias ZZZ="loginctl hibernate"

# no wget history file
alias wget='wget --no-hsts'

# program shortcuts
alias imv='imv -u nearest_neighbour' # better for pixel art
alias spt='spotify-tui'
alias nv=nvim
alias open=xdg-open


#  _____                       _       
# | ____|_  ___ __   ___  _ __| |_ ___ 
# |  _| \ \/ / '_ \ / _ \| '__| __/ __|
# | |___ >  <| |_) | (_) | |  | |_\__ \
# |_____/_/\_\ .__/ \___/|_|   \__|___/
#            |_|                       

export HISTSIZE=10000
export HISTFILESIZE=100000

export FZF_DEFAULT_OPTS='--preview "bat --style=full --color=always {}" --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'
export FZF_DEFAULT_COMMAND="fd --type f"

export EDITOR=nvim
export VISUAL=nvim
export TERM=foot

export XDG_CONFIG_HOME=$HOME/.config/
export XDG_CACHE_HOME=$HOME/.cache/
export XDG_DATA_HOME=$HOME/.local/share/
export XDG_STATE_HOME=$HOME/.local/state/
export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_CONFIG_DIRS=/etc/xdg/
export CARGO_HOME=$HOME/.local/share/cargo/
export RUSTUP_HOME=$HOME/.local/share/rustup/
export GRIM_DEFAULT_DIR=$HOME/Pictures/screenshots/
export GOPATH=$HOME/.local/share/go
export OLLAMA_MODELS=$XDG_DATA_HOME/ollama/models

# themes
export XCURSOR_THEME=Bibata-Modern-Classic
export XCURSOR_SIZE=32
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_STYLE_OVERRIDE=kvantum
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export GDK_SCALE=2

# wayland
export MOZ_ENABLE_WAYLAND=1
export WLR_RENDERER=vulkan
export QT_QPA_PLATFORM=wayland
export SDL_VIDEODRIVER=wayland
export GDK_BACKEND=wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto


#   ___  ____   ____ 
#  / _ \/ ___| / ___|
# | | | \___ \| |    
# | |_| |___) | |___ 
#  \___/|____/ \____|

# osc compatability
osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}

PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }osc7_cwd


#        _   _ _     
#  _   _| |_(_) |___ 
# | | | | __| | / __|
# | |_| | |_| | \__ \
#  \__,_|\__|_|_|___/
                   
# useful functions
countdown() {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
        echo "ERROR: first argument should be time in seconds"
        return
    fi

    start="$(( $(date '+%s') + $1 ))"
    while [ $start -ge $(date +%s) ]; do
        time_left="$(( $start - $(date +%s) ))"
        remaining_time=$(date -u -d "@$time_left" +%H:%M:%S)
        
        printf '\033[2J%s\033[H' "$(figlet -tc "$remaining_time")"
        sleep 0.1
    done
    printf '\033[2J'
}

stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        watch_time="$(date -u -d "@$time" +%H:%M:%S)"
        printf '\033[2J%s\033[H' "$(figlet -tc "$watch_time")"
        sleep 0.1
    done
    printf '\033[2J'
}

