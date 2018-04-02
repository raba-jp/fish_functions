function __force_process_kill -d "Interactively force process kill"
  ps axo rss,time,command | \
  sed -e '1d' | \
  peco --query "$LBUFFER" | \
  awk '{print $1}' | \
  xargs kill -9
end
