function __search_source_code --a code -d "Interactively source code search"
  function __is_exist_peco
    command type peco >/dev/null 2>&1
    echo $status
  end

  function __is_exist_ag
    command type ag >/dev/null 2>&1
    echo $status
  end

  [ (__is_exist_peco) -ne 0 ]; and echo "Requires 'peco' command."; and return
  [ (__is_exist_ag) -ne 0 ]; and echo "Requires 'ag' command."; and return
  set --local result (ag code | peco --on-cancel error)
  [ $status -ne 0 ]; and return
  set --local line_number (echo $result | awk -F : '{print "+" $2}')
  set --local file_name (echo $result | awk -F : '{print $1}')
  less -N $line_number $file_name
end
