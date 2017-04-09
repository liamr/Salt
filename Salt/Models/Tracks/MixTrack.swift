//
//  MixTrack.swift
//  Salt
//
//  Created by Brian on 09/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class MixTrack: Track, Nestable {
    var parent: Nestable? = nil
    
    // Node Properties
    var position: Vector2 = Vector2()
    
}
