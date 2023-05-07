//
//  AirTunesHandler.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2021/06/27.
//

import Foundation
import AirTunes
import AudioToolbox

class AirTunesHandler: ABPlayerServiceDelegate {
    var airTunes: AirTunes!
    var service: ABPlayerService!
    
    var playerInfo: ABPlayerInfo?
    var trackInfo: ABTrackInfo?
    
    var isActive: Bool {
        guard let duration = trackInfo?.duration else { return false }
        return duration != -1
    }
    
    init() {
        let currentHost = Host.current().localizedName ?? "Remote Master"
        airTunes = AirTunes(name: currentHost)
        airTunes.start()
        service = airTunes as ABPlayerService
        service.delegate = self
    }
    
    func playPause() { service.play() }
    func next() { service.next() }
    func previous() { service.previous() }
    
    func playerService(_ playerService: ABPlayerService, didChangeTrackInfo trackInfo: ABTrackInfo) {
        DispatchQueue.main.async {
            self.trackInfo = trackInfo
            NotificationCenter.default.post(name: .airTunesTrackInfoChanged, object: self, userInfo: nil)
        }
    }
    
    func playerService(_ playerService: ABPlayerService, didChangePlayerInfo playerInfo: ABPlayerInfo) {
        DispatchQueue.main.async {
            self.playerInfo = playerInfo
            self.setVolume(playerInfo.volume)
            NotificationCenter.default.post(name: .airTunesPlayerInfoChanged, object: self, userInfo: nil)
        }
    }
    
    private func setVolume(_ volume: Double) { //https://stackoverflow.com/questions/27290751/
        let vol = (volume + 30) / 30
        
        var defaultOutputDeviceID = AudioDeviceID(0)
        var defaultOutputDeviceIDSize = UInt32(MemoryLayout.size(ofValue: defaultOutputDeviceID))

        var getDefaultOutputDevicePropertyAddress = AudioObjectPropertyAddress(
            mSelector: kAudioHardwarePropertyDefaultOutputDevice,
            mScope: kAudioObjectPropertyScopeGlobal,
            mElement: AudioObjectPropertyElement(kAudioObjectPropertyElementMaster))

        _ = AudioObjectGetPropertyData(
            AudioObjectID(kAudioObjectSystemObject),
            &getDefaultOutputDevicePropertyAddress,
            0,
            nil,
            &defaultOutputDeviceIDSize,
            &defaultOutputDeviceID)
        
        var volume = Float32(vol) // 0.0 ... 1.0
        let volumeSize = UInt32(MemoryLayout.size(ofValue: volume))

        var volumePropertyAddress = AudioObjectPropertyAddress(
            mSelector: kAudioHardwareServiceDeviceProperty_VirtualMainVolume,
            mScope: kAudioDevicePropertyScopeOutput,
            mElement: kAudioObjectPropertyElementMaster)

        _ = AudioObjectSetPropertyData(
            defaultOutputDeviceID,
            &volumePropertyAddress,
            0,
            nil,
            volumeSize,
            &volume)
        
    }
}
