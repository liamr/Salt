//
//  Note.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa

class Note {
    var value: Int = 0;
    var velocity: Double = 1.0;
    var start: Double = 0.0;
    var length: Double = 1.0;
    var color: NSColor { get { return getColorFromVelocity() } }
    
    private func getColorFromVelocity() -> NSColor {
        return Config.instance.colors.noteMinVelocity.lerp(Config.instance.colors.noteMaxVelocity, velocity)
    }
}
