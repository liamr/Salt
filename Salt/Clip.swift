//
//  Clip.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa

protocol Clip {
    var name: String { get set }
    var length: Double { get set }
    var color: NSColor { get set }
    var state: ClipState { get set }
    
    // Playhead
    var playhead: Double { get set }
    
    // Loop
    var looping: Bool { get set }
    var loopStart: Double { get set }
    var loopEnd: Double { get set }
    
}
