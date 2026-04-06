if status is-interactive
    # Managing dot files (https://www.atlassian.com/git/tutorials/dotfiles)
    # curl -Lks https://is.gd/B5GXbi | /bin/bash
    alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

    set fish_greeting
    set fish_cursor_insert line
    set -x EDITOR nvim

    fish_vi_key_bindings

    # Need brew install fisher fzf && fisher install PatrickF1/fzf.fish
    fzf_configure_bindings --directory=\cf --processes=\cp --git_log=\cl --git_status=\cs
    set fzf_fd_opts --exclude Library


    function multicd
        echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
    end
    abbr --add dotdot --regex '^\.\.+$' --function multicd

    alias lg='lazygit'
    alias gs=git-spice

    if test -f ~/.config/fish/config.local.fish
        source ~/.config/fish/config.local.fish
    end

    starship init fish | source
    direnv hook fish | source

end
