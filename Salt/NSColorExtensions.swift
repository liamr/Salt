//
//  NSColorExtensions.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa

extension NSColor {    
    func lerp(_ color: NSColor, _ amount: Double) -> NSColor {
        let hue = self.hueComponent.lerp(color.hueComponent, CGFloat(amount))
        let saturation = self.saturationComponent.lerp(color.saturationComponent, CGFloat(amount))        
        let brightness = self.brightnessComponent.lerp(color.brightnessComponent, CGFloat(amount))
        let alpha = self.alphaComponent.lerp(color.alphaComponent, CGFloat(amount))
        return NSColor(calibratedHue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
}
