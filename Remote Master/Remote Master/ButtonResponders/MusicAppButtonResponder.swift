//
//  MusicAppButtonResponder.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/17.
//

import ScriptingBridge

class MusicAppButtonResponder: MediaKeyButtonResponder {
    let musicScripter = MusicScripter()
    let voxScripter = VOXScripter()
    let spotifyScripter = SpotifyScripter()
    
    var musicApp: AppScripter?
    
    func hasTarget() -> Bool {
        return musicScripter.isPlaying() || voxScripter.isRunning() || spotifyScripter.isRunning()
    }
    
    override func buttonDidPressed() {
        super.buttonDidPressed()
        
        if musicScripter.isRunning(), musicScripter.isPlaying() {
            musicApp = musicScripter
            return
        }
        
        if voxScripter.isRunning() {
            musicApp = voxScripter
            return
        }
        
        if spotifyScripter.isRunning() {
            musicApp = spotifyScripter
            return
        }
    }
    
    override func leftPressed() {
        musicApp?.previousTrack()
    }
    
    override func rightPressed() {
        musicApp?.nextTrack()
    }
    
    override func centerPressed() {
        musicApp?.playPause()
    }
}
