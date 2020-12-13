//
//  StatusBarMenu.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/15.
//

import Foundation

class StatusBarMenu {
    let menu = NSMenu()
    
    init() {
        menu.addItem(menuItem(title: "Debug Action", action: #selector(debugAction), target: self))
        menu.addItem(menuItem(title: "Preference", action: #selector(showPreference), target: self))
        menu.addItem(menuItem(title: "Quit", action: #selector(quit), target: self))
    }
    
    func menuItem(title: String, action: Selector, target: AnyObject?, keyEquivalent: String = "", mask: NSEvent.ModifierFlags = []) -> NSMenuItem {
        let item = NSMenuItem(title: title, action: action, keyEquivalent: keyEquivalent)
        item.target = target
        item.keyEquivalentModifierMask = mask
        return item
    }
    
    @objc func showPreference() {
        let preferenceWindowController = PreferenceWindowController(windowNibName: "PreferenceWindowController")
        preferenceWindowController.loadWindow()
        preferenceWindowController.showWindow(self)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    @objc func quit() {
        NSApplication.shared.terminate(self)
    }
    
    @objc func debugAction() {
        OpticalDrive().eject()
    }
}
