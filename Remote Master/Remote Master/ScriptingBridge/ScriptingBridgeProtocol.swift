//
//  ScriptingBridgeProtocol.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/11/17.
//

import ScriptingBridge

// Reference
//https://developer.apple.com/documentation/scriptingbridge
//https://brightdigit.com/blog/2017/06/09/scriptingbridge-with-swift-communicating-with-apps-using-applescript-and-swift/
//https://github.com/tingraldi/SwiftScripting
//https://github.com/milgra/macmediakeyforwarder

@objc public protocol SBObjectProtocol: NSObjectProtocol {
    func get() -> Any!
}

@objc public protocol SBApplicationProtocol: SBObjectProtocol {
    func activate()
    var delegate: SBApplicationDelegate! { get set }
    var isRunning: Bool { get }
}
