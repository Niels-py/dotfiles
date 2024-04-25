# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

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

alias l="lsd -lA"
alias ll="lsd -l"
alias ls="lsd"
alias la="lsd -A"
alias lsa="lsd -A"
alias tree="lsd --tree"
alias md="mkdir -p"
alias rm="trash-put"

alias wg-up="sudo wg-quick up de-fra-wg-401.conf"
alias wg-down="sudo wg-quick down de-fra-wg-401.conf"

alias py="python3"
alias venv=". ~/Documents/dev/python-venv/bin/activate"

alias mdl="yt-dlp --embed-metadata --embed-thumbnail --embed-chapters -x --audio-format mp3 -f bestaudio -o '%(title)s.%(ext)s'"
alias vdl="yt-dlp --format bestvideo+bestaudio --merge-output-format mkv --embed-subs --embed-metadata --sponsorblock-mark all -N 4 -o '%(title)s.%(ext)s'"
alias spotdl="~/Documents/dev/python-venv/bin/spotdl --preload --format mp3"

alias wget='wget --no-hsts'

alias kali="docker run --tty --interactive --privileged --rm kalilinux/kali-rolling"
alias poweroff="loginctl poweroff"
alias reboot="loginctl reboot"
alias zzz="loginctl suspend"
alias ZZZ="loginctl hibernate"
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."

FZF_DEFAULT_OPTS='--preview "bat --style=full --color=always {}" --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'
FZF_DEFAULT_COMMAND="fd --type f"

alias pipes=cpipes

alias nv=nvim

eval "$(starship init bash)"
eval "$(zoxide init bash)"
. "/home/niels/.local/share/cargo//env"

# fortune de | lolcat -h 0.3 -v 2
pokeget --hide-name random
