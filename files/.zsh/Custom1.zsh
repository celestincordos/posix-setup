alias ls='ls -G'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/enosotti/Tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/enosotti/Tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/enosotti/Tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/enosotti/Tools/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

setopt prompt_subst
autoload -Uz vcs_info

# zstyle ':vcs_info:git:*' formats 'git:%F{blue}%b%f '
zstyle ':vcs_info:*' enable git
# zstyle ':vcs_info:git*:*' get-revision true
# zstyle ':vcs_info:git*:*' check-for-changes true

precmd() {
    vcs_info

    prompt_git
    prompt_conda
    prompt_node
    prompt_k8s
}

prompt_git() {
    if [[ -n ${vcs_info_msg_0_} ]]; then
        GIT_STATUS=$(command git status --porcelain 2> /dev/null | tail -n1)
        GIT_BRANCH=$(git symbolic-ref HEAD | sed 's!refs\/heads\/!!')
        if [[ -n $GIT_STATUS ]]; then
            PROMPT_GIT_INFO="git:%F{red}$GIT_BRANCH%f "
        else
            PROMPT_GIT_INFO="git:%F{green}$GIT_BRANCH%f "
        fi
    else
        PROMPT_GIT_INFO=""
    fi
}

prompt_conda() {
    if [[ -n $CONDA_DEFAULT_ENV ]]; then
        PROMPT_CONDA_ENV="py:%F{blue}$CONDA_DEFAULT_ENV%f "
    else
        PROMPT_CONDA_ENV=""
    fi
}

prompt_node() {
    if [[ -n $NVM_DIR ]]; then
        NODE_MJ_VERSION=$(node --version | cut -d '.' -f1 | cut -d 'v' -f2)
        PROMPT_NODE="njs:%F{blue}$NODE_MJ_VERSION%f "
    else
        PROMPT_NODE=""
    fi
}

prompt_k8s() {
    KUBECONFIG_PATH="$HOME/.kube/config"
    if [[ -f $KUBECONFIG_PATH ]]; then
        K8S_CTX=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
        if [[ -n $K8S_CTX ]]; then
            PROMPT_K8S_CTX="k8s:%F{blue}$K8S_CTX%f "
        else
            PROMPT_K8S_CTX=""
        fi
    else
        PROMPT_K8S_CTX=""
    fi
}

NEWLINE=$'\n'
PROMPT='%F{green}%n%f %F{yellow}%~%f ${PROMPT_CONDA_ENV}${PROMPT_NODE}${PROMPT_K8S_CTX}${PROMPT_GIT_INFO}${NEWLINE}%# '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
