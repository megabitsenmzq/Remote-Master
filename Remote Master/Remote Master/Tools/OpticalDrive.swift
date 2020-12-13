//
//  OpticalDrive.swift
//  Remote Master
//
//  Created by Jinyu Meng on 2020/12/07.
//

import Foundation

class OpticalDrive {
    func eject() {
        func shell(_ args: String...) {
            let task = Process()
            task.launchPath = "/usr/bin/env"
            task.arguments = args
            task.launch()
        }
        shell("drutil", "eject")
    }
}
