if status is-interactive

    alias rm 'trash-put'

    alias l "eza --icons --git --group --time-style '+%Y-%m-%d %H:%M' --long --almost-all --mounts"
    alias lls "eza --icons --git --group --time-style '+%Y-%m-%d %H:%M' --long --almost-all --mounts --total-size"
    alias ls 'eza --icons'
    alias ll 'eza -1 --icons'
    alias la 'eza -1 --icons --almost-all'
    alias tree 'eza --tree --icons '
    alias treel 'eza --tree --icons --git --group --long --almost-all'
    alias treea 'eza --tree --icons --git --group --long'


    set -x FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

    set -x LS_COLORS $(vivid generate catppuccin-mocha)
    set -x MANPAGER "nvim -c 'Man!' -o -"

    alias ..='z ..'
    alias ...='z ../..'
    alias ....='z ../../..'
    alias .....='z ../../../..'
    alias ......='z ../../../../..'
    alias cd='z'
    alias py='python3'

    alias up='paru -Syu --noconfirm'

    set -g fish_greeting

    function venv
        set venv_path ~/Documents/venv
        if set -q VIRTUAL_ENV
            deactivate
        else
            source $venv_path/bin/activate.fish
        end
    end

    function vdl
        yt-dlp \
            -f "bv*+(251/mergeall[format_id~=251-])" \
            --merge-output-format mkv \
            --sub-langs all,-live_chat \
            --no-write-comments \
            --embed-subs \
            --embed-thumbnail \
            --audio-multistreams \
            --embed-chapters --embed-metadata \
            --sponsorblock-mark all \
            --cookies-from-browser firefox \
            --concurrent-fragments 8 \
            --fragment-retries 20 --retry-sleep 10 \
            -o "~/Videos/Youtube/%(uploader)s/%(title)s [%(id)s].%(ext)s" \
            $argv
    end

    function mdl
        yt-dlp \
            -f "bestaudio/best" \
            --extract-audio \
            --audio-format flac \
            --audio-quality 0 \
            --no-write-comments \
            --embed-thumbnail \
            --write-info-json --write-description \
            --embed-metadata \
            --all-subs --write-subs \
            --sub-langs all,-live_chat \
            --cookies-from-browser firefox \
            --concurrent-fragments 8 \
            --fragment-retries 20 --retry-sleep 10 \
            -o "~/Music/Youtube/%(uploader)s/%(title)s [%(id)s].%(ext)s" \
            $argv
    end


    zoxide init fish | source
    starship init fish | source
end
