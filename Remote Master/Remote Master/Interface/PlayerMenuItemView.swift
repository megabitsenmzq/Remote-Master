//
//  PlayerMenuItemView.swift
//  Remote Master
//
//  Created by 孟金羽 on 2021/06/26.
//

import Cocoa

class PlayerMenuItemView: NSView, NibLoadable {

    @IBOutlet weak var coverImageView: NSImageView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var ArtistAlbumView: NSTextField!
    @IBOutlet weak var progressBarView: NSProgressIndicator!
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        
    }
    
}
