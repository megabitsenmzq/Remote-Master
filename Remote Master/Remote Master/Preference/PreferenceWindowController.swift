//
//  PreferenceWindowController.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/17.
//

import Cocoa

class PreferenceWindowController: NSWindowController {
    let commonViewController = CommonPreferenceViewController(nibName: "CommonPreferenceViewController", bundle: Bundle.main)
    
    override init(window: NSWindow?) {
        super.init(window: window)
        contentViewController = commonViewController
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
}
