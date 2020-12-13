//
//  SpotifyScripter.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/12/13.
//

import ScriptingBridge

class SpotifyScripter: AppScripter {
    var spotifyApp: SpotifyApplication?
    let bundleIdentifier = "com.spotify.client"
    
    init() {
        if let application = SBApplication(bundleIdentifier: bundleIdentifier) {
            spotifyApp = application as SpotifyApplication
        }
    }
    
    func isRunning() -> Bool {
        guard let spotify = spotifyApp else { return false }
        return spotify.isRunning
    }
    
    func isPlaying() -> Bool {
        guard let spotify = spotifyApp else { return false }
        if !spotify.isRunning { return false }
        return (spotify.playerState == SpotifyEPlS.playing)
    }
    
    func playPause() {
        spotifyApp?.playpause?()
    }
    
    func pause() {
        spotifyApp?.pause?()
    }
    
    func nextTrack() {
        spotifyApp?.nextTrack?()
    }
    
    func previousTrack() {
        spotifyApp?.previousTrack?()
    }
}
