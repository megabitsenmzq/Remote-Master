//
//  MediaKeyButtonResponder.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/16.
//

import Foundation

class MediaKeyButtonResponder: ButtonResponder {
    let mediaKey = MediaKeySimulate()
    
    override func upPressed() {
        mediaKey.HIDPressMediaKey(key: .SoundUp)
    }
    
    override func downPressed() {
        mediaKey.HIDPressMediaKey(key: .SoundDown)
    }
    
    override func leftPressed() {
        mediaKey.HIDPressMediaKey(key: .Rewind)
    }
    
    override func rightPressed() {
        mediaKey.HIDPressMediaKey(key: .FastForward)
    }
    
    override func centerPressed() {
        mediaKey.HIDPressMediaKey(key: .Play)
    }
}
