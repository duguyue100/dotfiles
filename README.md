Keyboard layout
---------------

 * [QWERTY-Latin](X11/xkb/symbols/qwerty-latin)
 * [QWERTY-Cyrillic](X11/xkb/symbols/qwerty-cyrillic)

```
╔════╦════╦════╦════╦════╦════╦════╦════╦════╦════╦════╦════╦════╦════╦════╗
║esc.║ F1 ║ F2 ║ F3 ║ F4 ║ F5 ║del ║ F6 ║ F7 ║ F8 ║ F9 ║ F10║ F11║ F12║num.║
╚════╩════╩════╩════╩════╩════╣ ins╠════╩════╩════╩════╩════╩════╩════╬════╣
│ ~ ☠│ ! ¡│ @ ‘│ # ’│ $ £│ %  ╠════╣ ^  │ &  │ * ×│ (  │ ) ∅│ _ ‾│ + ±║calc║
│ ` ☠│ 1 „│ 2 “│ 3 ”│ 4 €│ 5  ║ ⌫  ║ 6 ¬│ 7  │ 8 ∞│ 9  │ 0 °│ - −│ = ≠║    ║
╔════╗────┼────┼────┼────┼────║    ║────┼────┼────┼────┼────┼────┼────╠════╣
║ ↹  ║ Q  │ W  │ E  │ R –│ T  ║    ║ Y  │ U  │ I  │ O  │ P  │ { ‹│ } ›║mail║
║    ║   æ│   é│   è│   ‑│    ║    ║   ✓│   ù│   î│   œ│   §│ [ «│ ] »║   ⇤║
╠════╣────┼────┼────┼────┼────╠════╣────┼────┼────┼────┼────┼────╔════╬════╣
║ ⇧  ║ A  │ S ☠│ D ☠│ F ☠│ G ☠║ ⏎  ║ H ↙│ J ↖│ K ↗│ L ↘│ : ↕│ "  ║ ⇧  ║ ⇪  ║
║    ║   à│   ´│   ^│   ¨│   ˙║    ║   ←│   ↓│   ↑│   →│ ☠ ↔│ '  ║    ║  AC║
║    ║────┼────┼────┼─══─┼────║    ║────┼─══─┼────┼────┼────┼────║    ╠════╣
║    ║ Z  │ X  │ C  │ V  │ B  ║    ║ N  │ M  │ ; ·│ :  │ ? †│ | ¦║    ║www ║
║    ║    │    │   ç│    │    ║   ‐║   ✗│    │ , •│ . …│ / ÷│ \  ║   +║   ⌫║
╠════╬════╦════╦════╦════╧════╩════╩════╧════╦════╦════╦════╦════╬════╬════╣
║ctrl║    ║app ║shuf║ :                      ║desk║ ⇱  ║ ⇑  ║ ⇲  ║ctrl║ ⇞  ║
║    ║cut ║copy║past║                        ║    ║    ║    ║    ║    ║  bk║
╠════╬════╩═╦══╩════╣ ␣ space                ╠════╬════╬════╬════╣    ╠════╣
║fn  ║start ║alt    ╠════════════════════════╣alt ║ ⇐  ║ ⇓  ║ ⇒  ║    ║ ⇟  ║
║    ║      ║       ║                        ║ gr ║    ║    ║    ║entr║  fw║
╚════╩══════╩═══════╝                        ╚════╩════╩════╩════╩════╩════╝
```

Window manager
--------------

 * [i3](i3/config) – [home page](http://i3wm.org)

[![](http://i.imgur.com/yyNR8iml.png)](http://i.imgur.com/yyNR8im.png)

Terminal
--------

 * [Termite](termite/config) – [home page](https://github.com/thestinger/termite)

Shell
-----

 * [fish](fish/config.fish) – [home page](http://fishshell.com)

[![](http://i.imgur.com/yFGA7vil.png)](http://i.imgur.com/yFGA7vi.png)

Editing
-------

 * [Kakoune](kak/kakrc) – [GitHub page](https://github.com/mawww/kakoune)

[![](http://i.imgur.com/b4cbnrol.png)](http://i.imgur.com/b4cbnro.png)

Browsing
--------

 * [Chromium](http://chromium.org)
   - [vi](chromium/Default/Extensions/vi)

Mail
----

 * [Sup](sup/config.yaml) – [home page](http://supmua.org)
 * [fdm](fdm.conf)        – [home page](http://fdm.sourceforge.net)
 * [msmtp](msmtprc)       – [home page](http://msmtp.sourceforge.net)

Scripts
-------

 * [bin](bin)

### [chronic](bin/chronic) – [Ruby](https://github.com/mojombo/chronic)

Natural language date/time parser in command-line.

[![](http://i.imgur.com/Ul1rDuWl.png)](http://i.imgur.com/Ul1rDuW.png)

### [interface](bin/interface) – [fish completion](fish/completions/interface.fish)

Declarative text/parser/emitter that can work on streams.

[![](http://i.imgur.com/UN0c0I5l.png)](http://i.imgur.com/UN0c0I5.png)

Setting up
----------

To set up, I just type [setup](setup).  It will install dotfiles in home and run
diff tool when conflict occurs.  It also set the right permission in the local
repository.
