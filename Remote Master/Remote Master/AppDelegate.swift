//
//  AppDelegate.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/15.
//

import Cocoa
import AirTunes

let remote = HIDRemote()
let statusBarItem = StatusBarItem()

var currentButtonResponder: ButtonResponder?
var mediaKeyButtonResponder = MediaKeyButtonResponder()
var musicAppButtonResponder = MusicAppButtonResponder()

var service: AirTunes?

//@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        _ = statusBarItem
        
        //HID Remote
        remote.setDelegate(self)
        remote.startControl(kHIDRemoteModeExclusive)
        
        currentButtonResponder = mediaKeyButtonResponder
        
        let currentHost = Host.current().localizedName ?? "Remote Master"
        service = AirTunes(name: currentHost)
        service!.start()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        //HID Remote
        remote.stopControl()
    }
    
}
