//
//  VOXScripter.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/17.
//

import Foundation
import ScriptingBridge

class VOXScripter: AppScripter {
    var voxApp: VOXApplication?
    let bundleIdentifier = "com.coppertino.Vox"
    
    init() {
        if let application = SBApplication(bundleIdentifier: bundleIdentifier) {
            voxApp = application as VOXApplication
        }
    }
    
    func isRunning() -> Bool {
        guard let vox = voxApp else { return false }
        return vox.isRunning
    }
    
    func isPlaying() -> Bool {
        guard let vox = voxApp else { return false }
        if !vox.isRunning { return false }
        return (vox.playerState == 1)
    }
    
    func playPause() {
        voxApp?.playpause?()
    }
    
    func pause() {
        voxApp?.pause?()
    }
    
    func nextTrack() {
        voxApp?.next?()
    }
    
    func previousTrack() {
        voxApp?.previous?()
    }
}
