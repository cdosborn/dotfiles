# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/Users/iamnotajudas/dotfiles/fzf/bin" ]]; then
  export PATH="$PATH:/Users/iamnotajudas/dotfiles/fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/Users/iamnotajudas/dotfiles/fzf/man" && -d "/Users/iamnotajudas/dotfiles/fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/iamnotajudas/dotfiles/fzf/man"
fi

# Prevent bash completion fzf from displaying colors 
export FZF_DEFAULT_OPTS='--no-color'
