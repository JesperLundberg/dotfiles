if status is-interactive
    # Commands to run in interactive sessions can go here
end

thefuck --alias | source

# Settings for theme
set -g theme_display_git_default_branch yes
set -g theme_use_abbreviated_branch_name no
set -g theme_date_format "+%H:%M"
set -g theme_display_git_branch yes

# Set environment variable
set -gx EDITOR nvim
