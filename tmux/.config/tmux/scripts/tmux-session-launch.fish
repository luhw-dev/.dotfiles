#!/usr/bin/env fish

# Use zoxide to find directories (or use `fd`/`find` if preferred)
set project (zoxide query -l | fzf --prompt="Start Project: " --preview="ls -la {}" --preview-window=up:wrap)

if test -n "$project"
    set session (basename $project)

    if not tmux has-session -t $session 2>/dev/null
        tmux new-session -ds $session -c $project
    end

    if set -q TMUX
        tmux switch-client -t $session
    else
        tmux attach-session -t $session
    end
end

