function peco_ssh
  awk '
    tolower($1)=="host" {
      for(i=2;i<=NF; i++) {
        if ($i !~ "[*?]") {
          print $i
        }
      }
    }
  ' ~/.ssh/config | sort | peco | read -l peco_ssh_hostname
  if test -n "$peco_ssh_hostname"
    command ssh $peco_ssh_hostname
  end
end
