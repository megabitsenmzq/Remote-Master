//
//  MediaKeySimulate.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/16.
//

import Foundation

class MediaKeySimulate {
    
    //https://stackoverflow.com/questions/11045814/emulate-media-key-press-on-mac
    
    enum HIDMediaKeyType: UInt32 {
        case SoundUp = 0
        case SoundDown = 1
        case Play = 16
        case Next = 17
        case Previous = 18
        case FastForward = 19
        case Rewind = 20
    }

    func HIDPressMediaKey(key: HIDMediaKeyType) {
        func doKey(down: Bool) {
            let flags = NSEvent.ModifierFlags(rawValue: (down ? 0xa00 : 0xb00))
            let data1 = Int((key.rawValue<<16) | (down ? 0xa00 : 0xb00))

            let ev = NSEvent.otherEvent(
                with:NSEvent.EventType.systemDefined,
                location: NSPoint(x:0,y:0),
                modifierFlags: flags,
                timestamp: 0,
                windowNumber: 0,
                context: nil,
                subtype: 8,
                data1: data1,
                data2: -1
            
            )
            let cev = ev?.cgEvent
            cev?.post(tap: CGEventTapLocation.cghidEventTap)
        }
        
        doKey(down: true)
        doKey(down: false)
    }
}
