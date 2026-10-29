if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Settings for theme
set -g theme_use_abbreviated_branch_name no
set -g theme_date_format "+%H:%M"
set -g theme_display_git_branch yes

# Set environment variable
set -gx EDITOR nvim

thefuck --alias | source

eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/jesperlundberg/.lmstudio/bin
# End of LM Studio CLI section

export PATH="$HOME/.local/bin:$PATH"
