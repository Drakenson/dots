autoload -Uz compinit promptinit up-line-or-beginning-search down-line-or-beginning-search
compinit
promptinit
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    up-line-or-beginning-search
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  down-line-or-beginning-search
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

#Green
#PROMPT='%B%(!.%F{196}.%F{#afd700})%n@%m:%f%F{39}%~%b%f%(!.#.$) '

#Blue
#PROMPT='%B%(!.%F{196}.%F{#afd700})%n@%m:%f%F{#596eb5}%~%b%f%(!.#.$) '

#Orange
PROMPT='%B%(!.%F{#ac583b}.%F{#685788})%n@%m:%f%F{#a26857}%~%b%f%(!.#.$) '

#Nord
#PROMPT='%B%(!.%F{#bf616a}.%F{#a3be8c})%n@%m:%f%F{#d08770}%~%b%f%(!.#.$) '

HISTFILE=~/.zhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
HISTSIZE=1000
SAVEHIST=1000

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

alias ls='ls --color=auto'
alias ll='ls -l'
alias dots='/usr/bin/git --git-dir=$HOME/.dots --work-tree=$HOME'
#alias df='~/.scripts/df.sh'
alias cputemp='sensors k10temp-pci-00c3 | grep Tctl'
