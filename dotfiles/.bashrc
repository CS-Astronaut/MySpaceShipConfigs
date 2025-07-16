alias ..='cd ..'
alias clean='clear && neofetch'
alias la='ls -ltrha'
alias lf='ranger'
alias ll='exa --icons -F -H --group-directories-first --git -1'
# alias cd='cd && ll'
alias nf='neofetch'
alias nv='nvim'
alias pwrf='sudo poweroff -f'
alias py='python3'
alias tl='prime-run java -jar ~/Games/T-Launcher/TLauncher.jar'
alias vim='nvim'

# setting xclip to copy a file content to clipboard by calling {xclip file} 
alias xclip='xclip -selection clipboard <'

alias pipes='pipes.sh -t 1 -C'

# # an exprimental bash script to improve cp mv and rm commands by adding status bar
# alias cp='~/file-transfer.sh cp'
# alias mv='~/file-transfer.sh mv'
# alias rm='~/file-transfer.sh rm'


alias hdd='cd /mnt/hdd/'

# cowsay -f tux your terminal is gross
figlet Astro Terminal -m 63
# echo "-----------------------------------------"
# cat $HOME/prompt_list.txt


# Setting The Default Shell Editor to NeoVim
export EDITOR=nvim

# Setting The Starship Shell on My Bash
eval "$(starship init bash)"

# A Simple Function To Source Python Virtual Environment
activate_env() {
    if [ -z "$1" ]; then
        echo "Usage: activate_env <env_name>"
        return 1
    fi
    local env_name="$1"
    if [ -d "$env_name/bin" ]; then
        source "$env_name/bin/activate"
    else
        echo "Error: Virtual environment '$env_name' does not exist."
        return 1
    fi
}
alias venv=activate_env


# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/amin/.lmstudio/bin"

alias dev="cd ~/Dev/Play\ Ground/"

alias md="ghostwriter"

# for pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# for Git 
alias gitlog='git log --graph --oneline --all'

# remapping side mouse buttons to left & right key
/home/amin/shellScripts/mouse_key_remap.sh

alias keymap='/home/amin/shellScripts/mouse_key_remap.sh'
