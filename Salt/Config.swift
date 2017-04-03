//
//  Config.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa

class Config {
    
    private init() {  }
    
    static let instance: Config = Config()
    
    var minWindowSize: Vector2 = Vector2(900, 600)
    
    // Config
    let preferences = Preferences()
}
