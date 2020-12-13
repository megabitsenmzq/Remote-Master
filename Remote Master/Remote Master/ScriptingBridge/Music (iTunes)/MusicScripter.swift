//
//  MusicAppStateGetter.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/16.
//

import Foundation
import ScriptingBridge

class MusicScripter: AppScripter {
    var musicApp: MusicApplication?
    var bundleIdentifier: String { get {
        if #available(macOS 10.15, *) {
            return "com.apple.music"
        } else {
            return "com.apple.iTunes"
        }
    } }
    
    init() {
        if let application = SBApplication(bundleIdentifier: bundleIdentifier) {
            musicApp = application as MusicApplication
        }
    }
    
    func isRunning() -> Bool {
        guard let music = musicApp else { return false }
        return music.isRunning
    }
    
    func isPlaying() -> Bool {
        guard let music = musicApp else { return false }
        if !music.isRunning { return false }
        return (music.playerState == MusicEPlS.playing)
    }
    
    func playPause() {
        musicApp?.playpause?()
    }
    
    func pause() {
        musicApp?.pause?()
    }
    
    func nextTrack() {
        musicApp?.nextTrack?()
    }
    
    func previousTrack() {
        musicApp?.previousTrack?()
    }
}
