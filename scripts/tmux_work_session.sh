#! /bin/sh

LAST_DIR=$(PWD)
SESSION="work"
cd ~

tmux new-session -d -s $SESSION \; \
  new-window -n 'Platform' \; \
  send-keys 'cd ~/git && lls .' C-m \; \
  split-window \; \
  select-pane -t 1 \; \
  split-window -h 'watch kubectl get all' \; \
  split-window -h 'watch kubectl get pv' \; \
  select-pane -t 4 \; \
  split-window -h \; \
  split-window -h \; \
  new-window -n 'Monitor' \; \
  send-keys 'bpytop' C-m \; \
  attach \;

cd $LAST_DIR  

