#! /bin/sh

LAST_DIR=$(PWD)
SESSION="work"
cd ~

tmux new-session -d -s $SESSION \; \
  new-window -n 'Platform' \; \
  send-keys 'cd ~/git && lls .' C-m \; \
  split-window \; \
  new-window -n 'Monitor' \; \
  send-keys 'bpytop' C-m \; \
  attach \;

cd $LAST_DIR  

