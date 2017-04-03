//
//  Theme.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa


class Theme {
    
    var name: String = ""
    
    var pianoRoll = PianoRollPallete()
    
    init () {
        
    }
    
    init(_ theme: String) {
        
    }
    
    static func set(_ name: String = DEFAULT_THEME) -> Theme {
        let t = load(name)
        App.current?.theme = t
        //UserDefaults.standard.set(t, forKey: "theme")
        
        return t
    }
    
    private static func load(_ theme: String) -> Theme {
        // TODO: Load theme from file system
        return Theme()
    }
    
    class PianoRollPallete {
        var background = NSColor(deviceRed:0.16, green:0.17, blue:0.21, alpha:1.00)
        
        var whiteKey: NSColor = .white
        var blackKey: NSColor = .black
        
        var noteSelected: NSColor = NSColor(hue:0.52, saturation:0.85, brightness:0.82, alpha:1.00)
        var noteMinVelocity: NSColor = NSColor(hue:0.53, saturation:1.00, brightness:0.59, alpha:1.00)
        var noteMaxVelocity: NSColor = NSColor(hue:0.24, saturation:0.44, brightness:0.62, alpha:1.00)
    }
}
