# ---------------- #
# base             #
# ---------------- #

# change prefix to C-a
set -g prefix C-a
unbind C-b

# send C-a with C-a*2
bind C-a send-prefix

# relaod configuration
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# decrease key stroke
set -sg escape-time 1

# history limit
set-option -g history-limit 10000

