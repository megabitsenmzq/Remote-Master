//
//  AppDelegate+HIDRemote.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/12/08.
//

import Foundation

extension AppDelegate: HIDRemoteDelegate {
    func hidRemote(_ hidRemote: HIDRemote!, eventWithButton buttonCode: HIDRemoteButtonCode, isPressed: Bool, fromHardwareWithAttributes attributes: NSMutableDictionary!) {
        
        let userInfo = ["buttonCode": buttonCode, "isPressed": isPressed] as [String : Any]
        NotificationCenter.default.post(name: .remoteButttonPressed, object: self, userInfo: userInfo)
        
        guard isPressed else { return }
        
        //Switch current responder on the fly
        if musicAppButtonResponder.isAnyAppRunning() {
            currentButtonResponder = musicAppButtonResponder
        } else {
            currentButtonResponder = mediaKeyButtonResponder
        }
        
        switch buttonCode {
        case kHIDRemoteButtonCodeMenuHold:
            OpticalDrive().eject()
            NSSound(named: "Bottle")?.stop()
        case kHIDRemoteButtonCodeUp, kHIDRemoteButtonCodeUpHold, kHIDRemoteButtonCodeDown, kHIDRemoteButtonCodeDownHold:
            currentButtonResponder?.buttonPressed(buttonCode: buttonCode, isPressed: isPressed)
        default:
            currentButtonResponder?.buttonPressed(buttonCode: buttonCode, isPressed: isPressed)
        }
    }
}

