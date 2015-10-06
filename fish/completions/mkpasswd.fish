# do not use file completion
complete --command mkpasswd --exclusive

# help completion
complete --command mkpasswd --short-option h --long-option help --description 'Print help message and exit'

complete --command mkpasswd --long-option password --description 'password'
complete --command mkpasswd --long-option username --description 'username'
complete --command mkpasswd --long-option domain   --description 'domain'
complete --command mkpasswd --long-option length   --description 'password length'
