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
    var enabled: Bool = true
    
    var time: Double = 0.0
    var duration: Double = 1.0
    
    var velocity: Int = 100
    var offVelocity: Int = 64
    
    init() { }
    
    init(velocity: Int = 100, time: Double, duration: Double) {
        self.velocity = velocity
        self.time = time
        self.duration = duration
    }
}
