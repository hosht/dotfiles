# ------------------- #
# copy and paste      #
# ------------------- #

# vi keybind
set-window-option -g mode-keys vi

# toggle copy mode
unbind [
bind v copy-mode \; display "Copy mode!"

# paste buffer
unbind ]
bind p paste-buffer

# less command like page up and down
unbind -T copy-mode-vi b
bind -T copy-mode-vi b send -X page-up
unbind -T copy-mode-vi f
bind -T copy-mode-vi f send -X page-down

# selection
unbind -T copy-mode-vi Space
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi V send -X select-line

# copy to tmux buffer and osx clipboard
unbind -T copy-mode-vi Enter
bind -T copy-mode-vi y send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

# scroll using mouse
set-option -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
bind -n WheelDownPane select-pane -t= \; send-keys -M

# copy texts with Option
set -g assume-paste-time 0

# copy and paste for vim in tmux
set-option -g default-command "reattach-to-user-namespace -l zsh"
