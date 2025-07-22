set -Ux EDITOR nvim
set -U fish_greeting ""

if uname -m | grep --quiet "arm64" 2>&1 > /dev/null ;
  eval (/opt/homebrew/bin/brew shellenv)
end

alias vi "nvim"
alias vim "nvim"
alias v "nvim ."
alias r "ranger"
alias g "lazygit"
alias p "bunx gitprompt@latest -y -t 1000000 && git push"
alias c "bunx gitprompt@latest -y -t 1000000"
alias cc "bunx gitprompt@latest"

# nodenv
status --is-interactive; and source (nodenv init -|psub)

# rbenv
if type -q rbenv
  set -x PATH $HOME/.rbenv/bin $PATH
  rbenv init - | source
end

if type -q pyenv
  set -Ux PYENV_ROOT $HOME/.pyenv
  fish_add_path $PYENV_ROOT/bin
  pyenv init - | source
end


# Tokyonight Theme
set -l foreground c0caf5
set -l selection 283457
set -l comment 565f89
set -l red f7768e
set -l orange ff9e64
set -l yellow e0af68
set -l green 9ece6a
set -l purple 9d7cd8
set -l cyan 7dcfff
set -l pink bb9af7

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection


export PATH="$PATH:$HOME/.local/bin"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

if type -q mise
  mise activate fish | source
end

if test -d (brew --prefix)"/share/fish/completions"
    set -p fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
