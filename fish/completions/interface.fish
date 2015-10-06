# do not use file completion
complete --command interface --exclusive

# help completion
complete --command interface --short-option h --long-option help --description 'Print help message and exit'

# command completion
complete --command interface --argument parse  --description 'parse text to JSON; Ruby named capture groups'
complete --command interface --argument format --description 'generate text from JSON; Ruby sprintf'
