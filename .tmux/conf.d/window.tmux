# ---------------- #
# window           #
# ---------------- #

# window and pane number starts with 1
set-option -g base-index 1
set-window-option -g pane-base-index 1

# renumber-windows when close window
set-option -g renumber-windows on

# new and kill window
bind -n C-t new-window
bind -n C-q kill-window

# | split pane horizontal
bind | split-window -h

# - split pane vertical
bind - split-window -v

# move panes and windows
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind -n C-] next-window
bind -n C-\\ previous-window

# change pane size
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5

# choose session
bind s choose-session
bind t choose-tree
bind w choose-tree -w

# Toggle Synchronize panes
bind B setw synchronize-panes on
bind b setw synchronize-panes off
