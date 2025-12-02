# ---------------- #
# plugins          #
# ---------------- #

set-environment -g TMUX_PLUGIN_MANAGER_PATH '~/.local/share/tmux/plugins'

# auto start terminal
set -g @continuum-boot 'on'
set -g @continuum-boot-options 'iterm'

# auto restore tmux
set -g @continuum-restore 'on'

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.local/share/tmux/plugins/tpm/tpm'
