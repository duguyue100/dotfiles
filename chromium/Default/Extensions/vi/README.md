vi
==

Overview
--------

_vi_ is an ultra-simple Chrome extension which brings modal mapping support.

Dependencies
------------

vi dependencies are:

 * [CoffeeScript](http://coffeescript.org)
 * [ImageMagick](http://imagemagick.org) to generate icons

Building
--------

To build, just type `make` in the [src/](src) directory.

Loading
-------

Open <chrome://extensions> in your browser, enable _Developer mode_ then
[Load unpacked extension…](src).

Testing
-------

To test, just type `make test` in the [src/](src) directory.

Configuring
-----------

Configure [content](src/content.coffee) and [background](src/background.coffee) scripts and rebuild the extension.
