# Currently only the less pager is supported.
ENV['PAGER'] = '/usr/bin/less --no-init --quit-if-one-screen'

Pry.config.editor = -> file, line do
  "kak -e 'edit #{file} #{line}'"
end

# Aliases ──────────────────────────────────────────────────────────────────────

Pry.commands.alias_command 'e', 'edit'

if defined? PryDebugger
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
