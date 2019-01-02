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
    var keyTracks: [Int: [Note]] = [Int: [Note]]()
    
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
        
        // TODO: Remove test data
        keyTracks = addTestNoteData()
    }
    
    func addTestNoteData() -> [Int: [Note]] {
        // TODO Write serialisation/ deserialisation step to pull this from JSON/ XML File
        let output: [Int : [Note]] = [
            0 : [Note(), Note()],
            4 : [Note(), Note()],
            6 : [Note(), Note()],
            12 : [Note(), Note()],
            13 : [Note(), Note()],
            40 : [ Note(time: 0.0, duration: 12.0) ]
        ]
        
        return output
    }
}
