//
//  MIDITrack.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class MIDITrack: Track, ClipTrack {
    
    // Node Properties
    var position: Vector2 = Vector2()
    
    var clips: [ClipSlot] = [ClipSlot]()
}
