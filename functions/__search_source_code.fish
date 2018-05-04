function __search_source_code --a code -d "Interactively source code search"
    function __is_exist_peco
        command type peco >/dev/null 2>&1
        echo $status
    end

    function __is_exist_rg
        command type rg >/dev/null 2>&1
        echo $status
    end

    [ (__is_exist_peco) -ne 0 ]
    and echo "Requires 'peco' command."
    and return
    [ (__is_exist_rg) -ne 0 ]
    and echo "Requires 'rg' command."
    and return
    rg --vimgrep code | awk -F : '{printf "%3s | %-50.50s | %s\n",$2,$1,$4}' | peco | awk -F'\|' '{print $2 " " $1}' | xargs less
end
