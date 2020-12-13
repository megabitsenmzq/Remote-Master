//
//  ButtonResponder.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/16.
//

import Foundation

class ButtonResponder {
    
    func buttonPressed(buttonCode: HIDRemoteButtonCode, isPressed: Bool) {
        
        buttonDidPressed()
        
        if isPressed {
            switch buttonCode {
            case kHIDRemoteButtonCodeUp:
                upPressed()
            case kHIDRemoteButtonCodeDown:
                downPressed()
            case kHIDRemoteButtonCodeLeft:
                leftPressed()
            case kHIDRemoteButtonCodeRight:
                rightPressed()
            case kHIDRemoteButtonCodeCenter:
                centerPressed()
            case kHIDRemoteButtonCodePlay:
                playPressed()
            default: break
            }
        }
    }
    
    func buttonDidPressed() { }
    
    //MARK: - Press
    
    func upPressed() { }
    
    func downPressed() { }
    
    func leftPressed() { }
    
    func rightPressed() { }
    
    func centerPressed() { }
    
    func playPressed() { }
    
    //MARK: - Hold
    
    func upHolded() { }
    
    func downHolded() { }
    
    func leftHolded() { }
    
    func rightHolded() { }
    
    func centerHolded() { }
    
    func playHolded() { }
    
    //MARK: - Release
    
    func upReleased() { }
    
    func downReleased() { }
    
    func leftReleased() { }
    
    func rightReleased() { }
}
