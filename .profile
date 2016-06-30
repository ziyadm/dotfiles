set -o vi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ls='ls -G'
alias claer='clear'
alias cd='pushd'
alias p='popd'
alias co='git checkout'
alias pull='git pull'
alias b='git branch'
alias clean="git gc && git branch | grep -v master | sed y/'*'/' '/ | cut -d ' ' -f 3 | xargs -n1 git branch -d $!"
alias test='git diff HEAD^ --name-only | grep spec | grep -v factor | xargs -n1 rspec --fail-fast'


export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

function prompt_command {
  PS_PWD="${PWD/#$HOME/~}"
  PS_FILL=""
  PS_GIT=" $(git rev-parse --short HEAD 2>/dev/null) "
  PS_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [ "$PS_BRANCH" != "HEAD" ]; then PS_GIT="$PS_GIT$PS_BRANCH "; fi
  if [ "$PS_GIT" == "   " ]; then PS_GIT=''; fi

  local len_prompt=$(echo -n "[${USER}@$(hostname -s) - 00:00 AM -${PS_GIT}${PS_PWD}]" | wc -c | tr -d " ")
  local len_rfill=$((COLUMNS - len_prompt - 1))
  while [[ $len_rfill > 0 ]]; do
    PS_FILL="${PS_FILL}―"
    len_rfill=$((len_rfill - 1))
  done

  if [[ $len_rfill < 0 ]]; then
    local len_cut=$((3 - len_rfill))
    PS_PWD="...$(echo -n $PS_PWD | sed -e "s/\(^.\{$len_cut\}\)\(.*\)/\2/")"
  fi
}

PROMPT_COMMAND=prompt_command

function termwide {
  local esc_white="\[\033[1;37m\]"
  local esc_host=$esc_white
  if [ `hostname -s` == "qi" ]; then esc_host=""; fi
  local esc_gray="\[\033[1;30m\]"
  local esc_reset="\[\033[0m\]"

  case $TERM in
    xterm*) esc_titlebar='\[\033]0;\u@\h:\w\007\]' ;;
    *)      esc_titlebar='' ;;
  esac

  PS1="$esc_titlebar\
$esc_gray[\u@$esc_host\h$esc_gray ― $esc_white\@$esc_gray ―$esc_white\${PS_GIT}$esc_gray\${PS_FILL} \${PS_PWD}]\n\
\$$esc_reset "

  PS2=">$esc_reset "
}

termwide

alias tree='tree -C'
export EDITOR="vim"
