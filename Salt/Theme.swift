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
    }
}
