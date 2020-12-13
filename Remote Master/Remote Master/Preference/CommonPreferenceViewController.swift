//
//  CommonPreferenceViewController.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/17.
//

import Cocoa
import ServiceManagement

class CommonPreferenceViewController: NSViewController {
    
    var isLaunchAtLoginEnabled = UserDefaults.standard.bool(forKey: "preference.LaunchAtLogin") {
        didSet { UserDefaults.standard.setValue(isLaunchAtLoginEnabled, forKey: "preference.LaunchAtLogin") }}

    @IBOutlet weak var launchAtLoginSwitch: NSButton!
    @IBAction func launchAtLoginSwitchChanged(_ sender: NSButton) {
        isLaunchAtLoginEnabled = (sender.state == .on)
        let helperIdentifier = "com.JinyuMeng.Remote-Master-Helper"
        
        //Tell OS to add login item.
        if !SMLoginItemSetEnabled(helperIdentifier as CFString, isLaunchAtLoginEnabled) {
            sender.state = isLaunchAtLoginEnabled ? .off : .on //fail
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchAtLoginSwitch.state = isLaunchAtLoginEnabled ? .on : .off
    }
    
}
