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
alias devdev="cd ~/Dev/Programming/After\ 2024/"
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
alias listpac='expac -H M "%-30n %m" | sort -k2 -h'
alias clean_cache='rm -rf ~/.cache/* ~/.cache/.* 2>/dev/null && sudo pacman -Scc'
alias lzfmpg='/home/amin/Dev/Programming/After\ 2024/Lazy-FFMPEG/lzfmpg.sh'
alias astroterm='astroterm --city Arāk -m -C -c -t 200 '

