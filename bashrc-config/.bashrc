# ~/.bashrc

alias ls='ls --color=auto'

alias vim=nvim

alias ebashrc='nvim ~/.bashrc'

alias sbashrc='source ~/.bashrc'

alias fvim='nvim $(fzf -m --preview="bat --color=always {}")'

alias grep='grep --color=auto'

alias egrep='egrep --color=auto'

alias fgrep='fgrep --color=auto'

alias getenv='printenv | grep -i'

alias df='df -h'

alias dusage='du -sh *>/dev/null'

alias cmkclean='cd .. && rm -rf build'

alias cmkbuild='mkdir -p build && cd build && cmake ..'

alias make='make -j $(nproc)'

alias mux='pgrep -vx tmux > /dev/null && \
        tmux new -d -s delete-me && \
        tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && \
        tmux kill-session -t delete-me && \
        tmux attach || tmux attach'

alias rebuild='cd .. && rm -rf build && mkdir -p build && cd build && cmake ..'

alias makej='make -j$(nproc)'

alias gs='git status'

if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

PS1='\[\e[1;32m\]\u \[\e[1;94m\]\w$(__git_ps1 " \[\e[0;34m\]git:(\[\e[1;31m\]%s\[\e[0;34m\])")\[\e[0m\]\n\$ '


PROMPT_DIRTRIM=1

# Ida
export PATH=$PATH:/opt/ida-free

# GO PATH export
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

export JAVA_HOME=/usr/lib/jvm/java-23-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Check if Hyprland is not already running
if [ -z "$(pgrep -x Hyprland)" ]; then
    /home/QQueke/.config/hypr/starthypr.sh
fi

. "$HOME/.cargo/env"


export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

export ROCM_PATH=/opt/rocm
export HSA_OVERRIDE_GFX_VERSION=10.3.0

export LD_LIBRARY_PATH=/home/QQueke/.local/lib:$LD_LIBRARY_PATH

ulimit -n 64000

export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
export PATH="$PATH:/home/QQueke/.local/bin"


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# -----------------------------
# Install missing dependencies via git only
# -----------------------------
# --- fzf ---
FZF_DIR="$HOME/.fzf"

if [ ! -d "$FZF_DIR" ]; then
    rm -rf "$FZF_DIR"  # clean broken clone if any
    echo "Installing fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all --no-bash --no-fish --no-zsh
fi

export FZF_DEFAULT_COMMAND='find . -type f'
eval "$(fzf --bash)"

# --- ble.sh ---
BLE_DIR="$HOME/.local/share/blesh"

if [ ! -d "$BLE_DIR" ]; then
    rm -rf "$BLE_DIR"  # clean broken clone if any
    echo "Installing ble.sh..."
    git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
    make -C ble.sh install PREFIX=~/.local
fi

source -- ~/.local/share/blesh/ble.sh

# Powerline for bash (Arch)
if command -v powerline-daemon >/dev/null 2>&1; then
    powerline-daemon -q
    export POWERLINE_BASH_CONTINUATION=1
    export POWERLINE_BASH_SELECT=1
    source /usr/lib/python3.14/site-packages/powerline/bindings/bash/powerline.sh
fi

alias gpf='git push -f'
alias gca='git commit --amend'

gco() { git checkout "$@"; }
ga() { git add "$@"; }
gst() { git status "$@"; }
gc() { git commit "$@"; }
gcm() { git commit -m "$@"; }
gph() { git push "$@"; }
gpl() { git pull "$@"; }
