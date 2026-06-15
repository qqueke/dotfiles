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

alias mux='pgrep -vx tmux > /dev/null && \ tmux new -d -s delete-me && \ tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh 
        && \ tmux kill-session -t delete-me && \ tmux attach || tmux attach'

alias rebuild='cd .. && rm -rf build && mkdir -p build && cd build && cmake ..'

alias makej='make -j$(nproc)'

alias gs='git status'

if [ -f /usr/share/git/completion/git-prompt.sh ]; then source /usr/share/git/completion/git-prompt.sh; fi

PS1='\[\e[1;32m\]\u \[\e[1;94m\]\w$(__git_ps1 " \[\e[0;34m\]git:(\[\e[1;31m\]%s\[\e[0;34m\])")\[\e[0m\]\n\$ '

PROMPT_DIRTRIM=1

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

