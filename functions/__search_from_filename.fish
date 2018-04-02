function __search_from_filename -d "Interactively search filename and open file"
  function __is_exist_peco
    command type peco >/dev/null 2>&1
    echo $status
  end

  function __is_exist_fd
    command type fd >/dev/null 2>&1
    echo $status
  end

  # Init find command
  set --local find_command "fd"
  [ (__is_exist_fd) -ne 0 ]; and set --local find_command "find . -type f"

  # Init filter command
  [ (__is_exist_peco) -ne 0 ]; and echo "Requires 'peco' command."; and return
  set --local peco_args "--select-1"
  [ (count $argv) -ne 0 ]; and set --local peco_args --query "$argv"

  eval $find_command | peco $peco_args | xargs $EDITOR
end
