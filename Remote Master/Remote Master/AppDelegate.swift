//
//  AppDelegate.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/15.
//

import Cocoa

let remote = HIDRemote()
let statusBarItem = StatusBarItem()
let airTunesHandler = AirTunesHandler()

var currentButtonResponder: ButtonResponder?
var mediaKeyButtonResponder = MediaKeyButtonResponder()
var musicAppButtonResponder = MusicAppButtonResponder()

//@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        _ = statusBarItem
        _ = airTunesHandler
        
        //HID Remote
        remote.setDelegate(self)
        remote.startControl(kHIDRemoteModeExclusive)
        
        currentButtonResponder = mediaKeyButtonResponder
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        //HID Remote
        remote.stopControl()
    }
    
}
