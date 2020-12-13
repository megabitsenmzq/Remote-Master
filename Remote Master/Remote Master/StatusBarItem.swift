//
//  StatusBarItem.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/15.
//

import Foundation

class StatusBarItem {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let statusBarMenu = StatusBarMenu()
    
    enum IconState: String {
        case normal = "StatusBarNormal"
        case action = "StatusBarAction"
        case up = "StatusBarUp"
        case down = "StatusBarDown"
        case left = "StatusBarLeft"
        case right = "StatusBarRight"
    }
    
    func iconStateFromButtonCode(_ buttonCode: HIDRemoteButtonCode) -> IconState {
        switch buttonCode {
        case kHIDRemoteButtonCodeUp, kHIDRemoteButtonCodeUpHold:
            return .up
        case kHIDRemoteButtonCodeDown, kHIDRemoteButtonCodeDownHold:
            return .down
        case kHIDRemoteButtonCodeLeft, kHIDRemoteButtonCodeLeftHold:
            return .left
        case kHIDRemoteButtonCodeRight, kHIDRemoteButtonCodeRightHold:
            return .right
        default:
            return .action
        }
    }
    
    init() {
        let button = statusItem.button
        button?.image = NSImage(named: IconState.normal.rawValue)
        button?.imagePosition = .imageOnly
        button?.target = self
        statusItem.menu = statusBarMenu.menu
        
        NotificationCenter.default.addObserver(self, selector: #selector(buttonPressed), name: .remoteButttonPressed, object: nil)
    }
    
    var indicatorTimer: Timer?
    
    @objc func buttonPressed(notification:Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else { return }
        guard let buttonCode = userInfo["buttonCode"] as? HIDRemoteButtonCode else { return }
        guard let isPressed = userInfo["isPressed"] as? Bool else { return }
        
        //Some buttons don't send up events in real-time. They will send it right after the down event. So button press animation should be simulated.
        
        var needToWaitButtonUpEvent = true
        let specialButtons = [
            kHIDRemoteButtonCodeMenuHold,
            kHIDRemoteButtonCodeCenterHold,
            kHIDRemoteButtonCodePlayHold
        ]
        if buttonCode.rawValue < 10 || specialButtons.contains(buttonCode) {
            needToWaitButtonUpEvent = false
        }
        
        if isPressed {
            indicatorTimer?.invalidate()
            indicatorTimer = nil
            if !needToWaitButtonUpEvent {
                indicatorTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false, block: { _ in
                    self.statusItem.button?.image = NSImage(named: IconState.normal.rawValue)
                })
            }
            
            statusItem.button?.image = NSImage(named: iconStateFromButtonCode(buttonCode).rawValue)
        } else {
            if needToWaitButtonUpEvent {
                statusItem.button?.image = NSImage(named: IconState.normal.rawValue)
            }
        }
    }
}
