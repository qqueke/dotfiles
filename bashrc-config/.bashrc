# ~/.bashrc

alias ls='ls --color=auto'

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

alias mux='pgrep -vx tmux > /dev/null && \ tmux new -d -s delete-me && \ tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh 
        && \ tmux kill-session -t delete-me && \ tmux attach || tmux attach'

alias rebuild='cd .. && rm -rf build && mkdir -p build && cd build && cmake ..'

alias makej='make -j$(nproc)'

# Required for our PS1
if command -v git >/dev/null 2>&1; then
  if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
  elif [ -f /usr/share/git/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git/contrib/completion/git-prompt.sh
  else
    git_exec=$(git --exec-path 2>/dev/null)
    git_prompt="$(dirname "$(dirname "$git_exec")")/share/git/contrib/completion/git-prompt.sh"
    if [ -f "$git_prompt" ]; then
      source "$git_prompt"
    fi
  fi
fi

PS1='\[\e[1;32m\]\u \[\e[1;94m\]\w$(__git_ps1 " \[\e[0;34m\]git:(\[\e[1;31m\]%s\[\e[0;34m\])")\[\e[0m\]\n\$ '

PROMPT_DIRTRIM=1

# Git aliases
alias gs='git status'
alias gpf='git push -f'
alias gca='git commit --amend'
alias gb='git branch'

# Git commands
gco() { git checkout "$@"; }
ga() { git add "$@"; }
gst() { git status "$@"; }
gc() { git commit "$@"; }
gcm() { git commit -m "$@"; }
gps() { git push "$@"; }
gpl() { git pull "$@"; }


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

