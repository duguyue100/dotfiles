# window.addEventListener('focus', function() {
#   document.title = 'focused';
#   });
#
#   window.addEventListener('blur', function() {
#     document.title = 'not focused';
#     });
$ ->

  Map.run
    'h'           : { help: 'Left',              call: -> $('html, body').animate { scrollLeft : '-=40'               },     0                                                                                                                 }
    'j'           : { help: 'Down',              call: -> $('html, body').animate { scrollTop  : '+=40'               },     0                                                                                                                 }
    'k'           : { help: 'Up',                call: -> $('html, body').animate { scrollTop  : '-=40'               },     0                                                                                                                 }
    'l'           : { help: 'Right',             call: -> $('html, body').animate { scrollLeft : '+=40'               },     0                                                                                                                 }
    'g'           : { help: 'Home',              call: -> $('html, body').animate { scrollTop  : 0                    }, 'slow'                                                                                                                }
    'alt k'       : { help: 'Back',              call: -> history.go(-1)                                                                                                                                                                       }
    'alt j'       : { help: 'Forward',           call: -> history.go(+1)                                                                                                                                                                       }
    'shift g'     : { help: 'End',               call: -> $('html, body').animate { scrollTop  : $(document).height() }, 'slow'                                                                                                                }
    'r'           : { help: 'Reload',            call: -> do location.reload                                                                                                                                                                   }
    'u'           : { help: 'Up (Directory)',    call: -> location.href = location.href.replace(/\/$/, '').match(/[a-z]+:\/\/.+\//)[0]                                                                                                         }
    'shift u'     : { help: 'Root',              call: -> location.href = location.origin                                                                                                                                                      }
    't'           : { help: 'New Tab',           call: -> chrome.extension.sendRequest { command: 'new tab', options: { url: 'chrome://newtab' }   }                                                                                           }
    'w'           : { help: 'Close Tab',         call: -> chrome.extension.sendRequest { command: 'close tab'   }                                                                                                                              }
    'shift w'     : { help: 'Restore Tab',       call: -> chrome.extension.sendRequest { command: 'restore tab' }                                                                                                                              }
    'alt h'       : { help: 'Previous Tab',      call: -> chrome.extension.sendRequest { command: 'previous tab' }                                                                                                                             }
    'alt l'       : { help: 'Next Tab',          call: -> chrome.extension.sendRequest { command: 'next tab' }                                                                                                                                 }
    'alt p'       : { help: 'Pin Tab',           call: -> chrome.extension.sendRequest { command: 'pin tab' }                                                                                                                                  }
    'alt shift h' : { help: 'Move Previous Tab', call: -> chrome.extension.sendRequest { command: 'move previous tab' }                                                                                                                        }
    'alt shift l' : { help: 'Move Next Tab',     call: -> chrome.extension.sendRequest { command: 'move next tab' }                                                                                                                            }
    'y'           : { help: 'Copy URL',          call: -> (Clipboard.copy location.href; chrome.extension.sendRequest { command: 'notify', options: { iconUrl: 'icons/128.png', type: 'basic', title: 'yank', message: Clipboard.paste() } } ) }
    'p'           : { help: 'Paste URL',         call: -> (token = Clipboard.paste(); location.href = (if url(token) then token else "https://google.com/search?q=#{token}"))                                                                  }
    'shift p'     : { help: 'Paste New Tab',     call: -> chrome.extension.sendRequest { command: 'new tab', options: { url: (token = Clipboard.paste(); (if url(token) then token else "https://google.com/search?q=#{token}")) } }           }
    'i'           : { help: 'Focus Input',       call: -> $('input:visible, textarea:visible').first().click().focus()                                                                                                                         }
    'd'           : { help: 'Detach Tab',        call: -> chrome.extension.sendRequest { command: 'detach tab' }                                                                                                                               }
    'shift d'     : { help: 'Attach Tab',        call: -> chrome.extension.sendRequest { command: 'attach tab' }                                                                                                                               }
    'f'           : { help: 'Hint Links',        call: -> do Hint.links.click                                                                                                                                                                  }

  url = (token) ->
    if token.match(/([a-z]+:\/\/)?[a-z]+\.[a-z]+(\.[a-z]+)?/) then true else false

# http://dmauro.github.io/Keypress
# ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
# Modifier keys are: meta, alt, option, ctrl, shift, and cmd.
