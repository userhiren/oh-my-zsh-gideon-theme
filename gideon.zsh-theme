# Gideon ZSH Theme

PROMPT='
HOST: %{$fg[yellow]%}`hostname`%{$reset_color%} 
$(_ip_info)
$(_user_host)${_current_dir} $(git_prompt_info) $(_ruby_version)
%{$fg_bold[$CARETCOLOR]%}>%{$resetcolor%} '
PROMPT2='%{$fg_bold[$CARETCOLOR]%}λ%{$reset_color%} '
RPROMPT='$(_vi_status)%{$(echotc UP 1)%}$(_git_time_since_commit) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'
local _current_dir="PATH: %{$fg[blue]%}%3~%{$reset_color%} "
local _return_status="%{$fg[red]%}%(?..⍉)%{$reset_color%}"
local _hist_no="%{$fg[grey]%}%h%{$reset_color%}"
function _ip_info() {
  local _ip_address="Not Connected";
  
  case "$OSTYPE" in
    solaris*) ;;
    darwin*)  
        if [[ -n `ipconfig getifaddr en0` ]]; then
          _ip_address=`ipconfig getifaddr en0`
        elif [[ -n `ipconfig getifaddr en2` ]]; then
          _ip_address=`ipconfig getifaddr en2`
        elif [[ -n `ipconfig getifaddr en2` ]]; then
          _ip_address=`ipconfig getifaddr en2`
        elif [[ -n `ipconfig getifaddr en3` ]]; then
          _ip_address=`ipconfig getifaddr en3`
        elif [[ -n `ipconfig getifaddr en4` ]]; then
          _ip_address=`ipconfig getifaddr en4`
        elif [[ -n `ipconfig getifaddr en5` ]]; then
          _ip_address=`ipconfig getifaddr en5`
        elif [[ -n `ipconfig getifaddr en6` ]]; then
          _ip_address=`ipconfig getifaddr en6`
        elif [[ -n `ipconfig getifaddr en7` ]]; then
          _ip_address=`ipconfig getifaddr en7`
        fi
        ;; 
    linux*)
        _ip_address=`ip -4 addr | grep "enp*" | grep -oP '(?<=inet\s)\d+(\.\d+){3}'`
        ;;
    bsd*)     ;;
    msys*)    ;;
    *)        ;;
  esac
  

  echo "IP ADDRESS: %{$fg[green]%}$_ip_address%{$reset_color%}"
}
function _current_dir() {
  local _max_pwd_length="65"
  if [[ $(echo -n $PWD | wc -c) -gt ${_max_pwd_length} ]]; then
    echo "PATH: %{$fg[blue]%}%-2~ ... %3~%{$reset_color%} "
  else
    echo "PATH: %{$fg[blue]%}%~%{$reset_color%} "
  fi
}
function _user_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}
function _vi_status() {
  if {echo $fpath | grep -q "plugins/vi-mode"}; then
    echo "$(vi_mode_prompt_info)"
  fi
}
function _ruby_version() {
  if {echo $fpath | grep -q "plugins/rvm"}; then
    echo "%{$fg[grey]%}$(rvm_prompt_info)%{$reset_color%}"
  elif {echo $fpath | grep -q "plugins/rbenv"}; then
    echo "%{$fg[grey]%}$(rbenv_prompt_info)%{$reset_color%}"
  fi
}
# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
# Only proceed if there is actually a commit.
  if git log -1 > /dev/null 2>&1; then
    # Get the last commit.
    last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
    now=$(date +%s)
    seconds_since_last_commit=$((now-last_commit))
    # Totals
    minutes=$((seconds_since_last_commit / 60))
    hours=$((seconds_since_last_commit/3600))
    # Sub-hours and sub-minutes
    days=$((seconds_since_last_commit / 86400))
    sub_hours=$((hours % 24))
    sub_minutes=$((minutes % 60))
    if [ $hours -gt 24 ]; then
      commit_age="${days}d"
    elif [ $minutes -gt 60 ]; then
      commit_age="${sub_hours}h${sub_minutes}m"
    else
      commit_age="${minutes}m"
    fi
    color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL
    echo "$color$commit_age%{$reset_color%}"
  fi
}
if [[ $USER == "root" ]]; then
  CARETCOLOR="red"
else
  CARETCOLOR="yellow"
fi
MODE_INDICATOR="%{$fg_bold[yellow]%}❮%{$reset_color%}%{$fg[yellow]%}❮❮%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}◒ "
# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[white]%}"
# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'
