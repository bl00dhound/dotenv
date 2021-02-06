#/bin/sh

LAST_DIR=$(PWD)
SESSION="work"
cd ~

tmux new-session -s $SESSION \; \
  new-window -t $SESSION -n 'XXX' \; \
  send-keys 'cd ~/git/some_project && clear' C-m \; \
  split-window -h \; \
  select-pane -t 2 \; \
  send-keys 'cd ~/git/some_project && clear' C-m \; \
  split-window -v \; \
  send-keys 'cd ~/git/some_project/ && clear' C-m \; \
  new-window -t $SESSION -n 'ZZZZZ' \; \
  send-keys 'cd ~/git && lls .' C-m \; \
  split-window -h \; \
#  select-pane -t 1 \; \
  send-keys 'cd ~/git' \; \

cd $LAST_DIR  

