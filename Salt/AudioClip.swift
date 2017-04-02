//
//  AudioClip.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa

class AudioClip: Clip {
    var notes: [Note] = [Note]()
    
    var name: String = ""
    var length: Double = 1.0
    var color: NSColor = NSColor.orange
    var state: ClipState = .atRest
    
    // Playhead
    var playhead: Double = 0.0
    
    // Loop
    var looping: Bool = false
    var loopStart: Double = 0.0
    var loopEnd: Double
    
    init() {
        loopEnd = length
    }
}
