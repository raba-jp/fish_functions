function __select_repository -d "Interactively select repository"
  ghq list | peco --select-1 | read line
  set --local root (ghq root)
  [ $line ]; and cd $root/$line
  commandline -f repaint
end
