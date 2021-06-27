//
//  AirTunesButtonResponder.swift
//  Remote Master
//
//  Created by 孟金羽 on 2021/06/27.
//

import Foundation

class AirTunesButtonResponder: MediaKeyButtonResponder {
    override func leftPressed() {
        airTunesHandler.playPause()
    }
    
    override func rightPressed() {
        airTunesHandler.next()
    }
    
    override func centerPressed() {
        airTunesHandler.previous()
    }
}
