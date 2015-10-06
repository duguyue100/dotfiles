this.Map =

  run: (mappings) ->

    listener = new window.keypress.Listener()

    $.each mappings, (command, object) ->
      listener.register_combo
        keys        : command
        on_keydown  : -> do object.call
        is_solitary : true

    $ 'input, textarea, :input'
      .bind 'focus', -> do listener.stop_listening
      .bind 'blur',  -> do listener.listen
