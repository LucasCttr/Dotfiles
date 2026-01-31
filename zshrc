# Created by newuser for 5.9


# Prompt estilo Bash: usuario@host carpeta $
# PROMPT='%F{magenta}%n%f %F{cyan}%~%f '


PROMPT='%F{#ee82ee}%n%f %F{#e2aef2}%~%f '  # Más claro
[[ -o interactive ]] && fastfetch



# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load Angular CLI autocompletion.
# source <(ng completion script)


# ===== ZSH INTELIGENTE =====

# Completions extra (si lo instalaste)
fpath=(~/.zsh/zsh-completions $fpath)

# Autocompletado avanzado
autoload -Uz compinit
compinit

# Mejoras de completado
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Historial inteligente
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history

# Autosuggestions (sugerencias inteligentes)
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#777777'
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ⚠️ SIEMPRE AL FINAL
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh