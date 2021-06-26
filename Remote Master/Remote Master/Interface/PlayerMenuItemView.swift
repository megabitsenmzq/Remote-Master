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
    }
    
    @objc func updatePlayer() {
        coverImageView.image = airTunesHandler.trackInfo?.artwork
        titleLabel.stringValue = airTunesHandler.trackInfo?.name ?? "Unknown"
        artistAlbumView.stringValue = "\(airTunesHandler.trackInfo?.album ?? "Unknown") - \(airTunesHandler.trackInfo?.artist ?? "Unknown")"
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
    }
    
}
