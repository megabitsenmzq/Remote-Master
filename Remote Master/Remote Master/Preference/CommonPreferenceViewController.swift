//
//  CommonPreferenceViewController.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/17.
//

import Cocoa
import ServiceManagement

class CommonPreferenceViewController: NSViewController {
    @IBOutlet weak var launchAtLoginSwitch: NSButton!
    @IBOutlet weak var debugModeSwitch: NSButton!
    
    var isLaunchAtLoginEnabled = UserDefaults.standard.bool(forKey: "preference.LaunchAtLogin") {
        didSet { UserDefaults.standard.setValue(isLaunchAtLoginEnabled, forKey: "preference.LaunchAtLogin") }}
    
    @IBAction func launchAtLoginSwitchChanged(_ sender: NSButton) {
        isLaunchAtLoginEnabled = (sender.state == .on)
        let helperIdentifier = "com.JinyuMeng.Remote-Master-Helper"
        
        //Tell OS to add login item.
        if !SMLoginItemSetEnabled(helperIdentifier as CFString, isLaunchAtLoginEnabled) {
            sender.state = isLaunchAtLoginEnabled ? .off : .on //fail
        }
    }
    
    @IBAction func debugModeSwitchChanged(_ sender: NSButton) {
        isDebugModeEnabled = (sender.state == .on)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchAtLoginSwitch.state = isLaunchAtLoginEnabled ? .on : .off
        debugModeSwitch.state = isDebugModeEnabled ? .on : .off
    }
    
}
