if status is-interactive

    alias rm='trash-put'
    alias l="eza --icons --git --group --time-style '+%Y-%m-%d %H:%M' --long --almost-all --mounts"
    alias lls="eza --icons --git --group --time-style '+%Y-%m-%d %H:%M' --long --almost-all --mounts --total-size"
    alias ls="eza --icons"
    alias ll="eza -1 --icons"
    alias la="eza -1 --icons --almost-all"

    set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

    set -Ux LS_COLORS $(vivid generate catppuccin-mocha)

    set -Ux MANPAGER "nvim -c 'Man!' -o -"

    zoxide init fish | source
    starship init fish | source
end
