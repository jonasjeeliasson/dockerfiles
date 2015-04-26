#! /bin/bash
_term() { 
  printf "%s\n" "Caught SIGTERM signal!" 
  kill -TERM $child 2>/dev/null
  exit 0;
}
trap _term SIGTERM
[ ! -f /data/nzbget.conf ] && cp /usr/local/share/nzbget/nzbget.conf /data/nzbget.conf

nzbget --configfile /data/nzbget.conf --daemon &

child=$! 
wait "$child"
