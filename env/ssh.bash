# SSH Host alias tab-completion
complete -o default -o nospace -W \
  "$(grep '^Host' $HOME/.ssh/config | grep -v '[?*]' | cut -d' ' -f2)" \
  scp sftp ssh
