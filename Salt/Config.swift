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
    
    // Config
    let colors = Colors()
    let preferences = Preferences()
}

class Colors {
    
    let pathToColorPlist = Bundle.main.path(forResource: "Color", ofType: "plist")
    let colorsDict: NSDictionary
    
    var noteSelected: NSColor { get { return parsePlistProperty("NoteSelected") } }
    var noteMinVelocity: NSColor { get { return parsePlistProperty("NoteMinVelocity") } }
    var noteMaxVelocity: NSColor { get { return parsePlistProperty("NoteMaxVelocity") } }
    
    init () {
        colorsDict = NSDictionary(contentsOfFile: pathToColorPlist!)!
    }
    
    private func parsePlistProperty(_ key: String) -> NSColor {
        let colorString = colorsDict[key] as! String
        
        if colorString.isEmptyOrWhitespace() {
            return NSColor.orange
        }
        
        let c = colorString.components(separatedBy: ",")
        return NSColor(calibratedRed: CGFloat((c[0] as NSString).doubleValue),
                       green: CGFloat((c[1] as NSString).doubleValue),
                       blue: CGFloat((c[2] as NSString).doubleValue),
                       alpha: CGFloat((c[3] as NSString).doubleValue))
    }
}
