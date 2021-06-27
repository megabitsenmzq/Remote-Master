# Remote master

[![Platforms macOS](https://img.shields.io/badge/Platforms-macOS-purple.svg?style=flat)](http://www.apple.com/macos/)
[![License GPLv3](https://img.shields.io/badge/License-GPLv3-blue.svg?style=flat)](https://www.gnu.org/licenses/gpl-3.0.html)

Remote Master is an Apple Remote utility to enhance the IR remote control of macOS. It has some useful features and still under construction. 

## Current working features:

- Control any media player application that can monitor media keys.
- Control priority lets you control iTunes only when it’s playing. VOX will be the next. If both of them are not running, it will control another app that is monitoring the media keys.
- Long press the menu button to eject the optical drive.
- With the embedded AirTunes server, you can play your music remotely using AirPlay.

## Plans:

- Add more exclusively controllable apps.
- Change applications priority to control.
- Configurable voice menu to execute useful actions.
- Apply shortcuts to remote keys.


This app is using [HIDRemote(BSDv3)](https://github.com/iospirit/HIDRemote) to handle Apple Remote event, [AirTunes(Apache 2.0)](https://github.com/megabitsenmzq/airtunes) to handle AirPlay.


The app icon is designed by myself, you can like me on [Dribbble](https://dribbble.com/shots/14594252-Remote-Icon).
