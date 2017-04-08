//
//  ClipTrack.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class ClipTrack: Track, Nestable {
    
    var parent: Nestable? = nil
    
    var position: Vector2 = Vector2()
    var clips: [ClipSlot] = [ClipSlot]()
}
