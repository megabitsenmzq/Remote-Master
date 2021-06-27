//
//  PlayerMenuItemView.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2021/06/26.
//

import Cocoa

class PlayerMenuItemView: NSView, NibLoadable {

    @IBOutlet weak var coverImageView: NSImageView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var artistAlbumView: NSTextField!
    @IBOutlet weak var progressBarView: NSProgressIndicator!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePlayer), name: .airTunesTrackInfoChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePlayer), name: .airTunesPlayerInfoChanged, object: nil)
    }
    
    @objc func updatePlayer() {
        guard let trackInfo = airTunesHandler.trackInfo else { return }
        if airTunesHandler.isActive {
            coverImageView.image = trackInfo.artwork
            titleLabel.stringValue = trackInfo.name
            artistAlbumView.stringValue = "\(trackInfo.album) - \(trackInfo.artist)"
            progressBarView.doubleValue = trackInfo.position / trackInfo.duration * 100
        } else {
            coverImageView.image = NSImage(named: "Cover")
            titleLabel.stringValue = "Remote Master"
            artistAlbumView.stringValue = "AirPlay server is running."
            progressBarView.doubleValue = 100
        }
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
    }
    
}
