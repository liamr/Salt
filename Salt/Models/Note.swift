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
    var isEnabled: Bool = true
    
    var value: Int = 0;
    var velocity: Double = 1.0;
    
    var time: Double = 0.0;
    var duration: Double = 1.0;
    
    var onVelocity: Int = 128
    var offVelocity: Int = 64
    
    private func getColorFromVelocity() -> NSColor {
        return (App.current?.theme.pianoRoll.noteMinVelocity.lerp((App.current?.theme.pianoRoll.noteMaxVelocity)!, velocity))!
    }
}
