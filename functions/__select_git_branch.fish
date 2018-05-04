function __select_git_branch -d "Interactively git branch select"
    function __is_exist_peco
        command type peco >/dev/null 2>&1
        echo $status
    end

    [ (__is_exist_peco) -ne 0 ]
    and echo "Requires 'peco' command."
    and return
    git branch -a --sort=-authordate | cut -b 3- | perl -pe 's#^remotes/origin/###' | perl -nlE 'say if !$c{$_}++' | grep -v -- "->" | peco | xargs git checkout
end
