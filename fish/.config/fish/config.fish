# ~/.config/fish/config.fish

eval (direnv hook fish)
# Ruby Gems
set -gx GEM_HOME "/home/luhw/.local/share/gem/ruby/3.4.0"
fish_add_path "$GEM_HOME/bin"
# ─────────────────────────────────────────────
# Ensure this runs only in interactive shell
# ─────────────────────────────────────────────
if not status is-interactive
    exit
end

# ─────────────────────────────────────────────
# PATH Setup
# ─────────────────────────────────────────────
set -gx PATH $PATH $HOME/.config/composer/vendor/bin
set -gx GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

#─────────────────────────────────────────────
# Prompt (Starship)
# ─────────────────────────────────────────────
starship init fish | source
set -g fish_greeting ""

# ─────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────
alias ls="eza --color=always --long --git --icons=always --no-time --no-user --no-permissions"
alias l="ls -la"
alias c="code"
alias takeout="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock --add-host=host.docker.internal:host-gateway -it tighten/takeout:latest"
alias vim="nvim"
alias lzd="lazydocker"
alias lzg="lazygit"
alias art="php artisan"

# ─────────────────────────────────────────────
# FZF + Zoxide
# ─────────────────────────────────────────────
fzf --fish | source
zoxide init fish | source

set -gx FZF_CTRL_T_OPTS "
    --style=full
    --walker-skip .git,node_modules,target
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# ─────────────────────────────────────────────
# Tmux: FZF session switcher
# ─────────────────────────────────────────────
function tmux-fzf-switch
    ~/.config/tmux/scripts/tmux-session-switch.fish
end

function tmux-fzf-project
    ~/.config/tmux/scripts/tmux-session-launch.fish
end

# Key bindings (optional)
bind \cf tmux-fzf-switch # Ctrl-f to switch sessions
bind \cp tmux-fzf-project # Ctrl-p to pick & start a project

# ─────────────────────────────────────────────
# Optional: Spacefish compatibility
# ─────────────────────────────────────────────
# (Legacy or unused with Starship, safe to remove if not used)
function grep_dotfiles_in_config
    set dotfiles_dir ~/dotfiles

    # Get all subdirectories (not files) in dotfiles
    set dirs (find $dotfiles_dir -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)

    # Join them with `|` for grep pattern
    set pattern (string join '|' $dirs)

    # List matching directories in ~/.config
    ls ~/.config | grep -E "$pattern"
end

alias claude="/home/luhw/.claude/local/claude"
alias screenshot="/home/luhw/scripts/screenshot.sh"
