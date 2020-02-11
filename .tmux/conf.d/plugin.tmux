# ---------------- #
# plugins          #
# ---------------- #

# auto start terminal
set -g @continuum-boot 'on'
set -g @continuum-boot-options 'iterm'

# auto restore tmux
set -g @continuum-restore 'on'

# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'jonmosco/kube-tmux'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
