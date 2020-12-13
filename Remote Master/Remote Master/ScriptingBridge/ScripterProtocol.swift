//
//  Scripter.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/17.
//

import Foundation

protocol AppScripter {
    func isRunning() -> Bool
    func isPlaying() -> Bool
    
    func playPause()
    func pause()
    func nextTrack()
    func previousTrack()
}
