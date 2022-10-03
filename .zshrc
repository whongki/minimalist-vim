ZSH_THEME=pure
fpath+=("$(brew --prefix)/share/zsh/site-functions")
# .zshrc
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:path color '#5dc8fd'

# config for zsh-syntax
source /Users/admin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey -v
export CLICOLOR=1
