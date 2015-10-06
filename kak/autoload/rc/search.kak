face search +bi

def search-highlighting-enable -docstring 'Enable search highlighting' %{
  hook window -group search-highlighting NormalKey [/?*nN]|<a-[/?*nN]> %{ try %{
    addhl dynregex '%reg{/}' 0:search
  }}
  hook window -group search-highlighting NormalKey <esc> %{ try %{
    rmhl dynregex_%reg{<slash>}
  }}
}

def search-highlighting-disable -docstring 'Disable search highlighting' %{
  rmhl dynregex_%reg{<slash>}
  rmhooks window search-highlighting
}
