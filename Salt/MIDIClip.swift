//
//  MIDIClip.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa

class MIDIClip: Clip {
    var notes: [Note] = [Note]()
    
    var name: String = ""
    var length: Double = 1.0
    var color: NSColor = NSColor.orange
    var state: ClipState = .atRest
    
    // Playhead
    var playhead: Double = 0.0
    var timeSignature: TimeSignature = TimeSignature()
    
    // Loop
    var looping: Bool = false
    var loopStart: Double = 0.0
    var loopEnd: Double
    
    // Grid
    var grid: Grid = Grid()
    
    init() {
        loopEnd = length
    }
}
