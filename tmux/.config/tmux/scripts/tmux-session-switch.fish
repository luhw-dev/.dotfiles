#!/usr/bin/env fish

set session (tmux list-sessions -F '#S' | fzf --prompt="Tmux Sessions: " --preview="tmux list-windows -t {}" --preview-window=up:wrap)

if test -n "$session"
    if set -q TMUX
        tmux switch-client -t $session
    else
        tmux attach-session -t $session
    end
end
