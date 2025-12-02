# ------------------- #
# status bar          #
# ------------------- #

# set status bar on top
set-option -g status-position top

# 256 color
set-option -g default-terminal "screen-256color"

# refresh interval
set -g status-interval 5

# status bar
set -g status-style fg=default,bg=colour236

# inactive windows
set-window-option -g window-status-style fg=default,bg=default

# active windows
set-window-option -g window-status-current-style fg=colour16,bg=yellow

# command line
set -g message-style fg=white,bg=black,bright

# status bar position
set-option -g status-position top

set-option -g status-left-length 120
set-option -g status-right-length 120

# status bar left 'Host name|Session name:[Pane number]'
set -g status-left '#{?client_prefix,#[reverse],}#[fg=blue]#[bg=colour237]#[bold]#H|#S:[#P]'

# TODO add git status, AWS/GCP cli account, Kubernetes context
# status bar right
set -g status-right ''

# enable monitor activity and disable sending a bell
setw -g monitor-activity on
set -g visual-activity on
