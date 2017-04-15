//
//  PianoRollView.swift
//  Salt
//
//  Created by Brian on 06/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa

class PianoRollView: NSView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.wantsLayer = true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
        
        
        let subLayer = CALayer()
        subLayer.frame = dirtyRect
        
        subLayer.addSublayer(addNoteBars(subLayer))
        
        self.layer?.addSublayer(subLayer)
    }
    
    func addNoteBars(_ layer: CALayer, amount: Int = 128) -> CALayer {
        
        let output: CALayer = CALayer()
        
        for i in 1...amount {
            let keyHeight = layer.frame.height / CGFloat(amount)
            let keyYPos = keyHeight * CGFloat(i)
            
            let shapeLayer = CALayer()
            
            shapeLayer.bounds = CGRect(x: 0.0, y: keyYPos, width: layer.frame.width, height: keyHeight)
            shapeLayer.backgroundColor = NSColor.blue.cgColor
            
            output.addSublayer(shapeLayer)
        }
        
        return output
    }
}

//CALayer *sublayer = [CALayer layer];
//sublayer.backgroundColor = [UIColor blueColor].CGColor;
//sublayer.shadowOffset = CGSizeMake(0, 3);
//sublayer.shadowRadius = 5.0;
//sublayer.shadowColor = [UIColor blackColor].CGColor;
//sublayer.shadowOpacity = 0.8;
//sublayer.frame = CGRectMake(30, 30, 128, 192);
//sublayer.borderColor = [UIColor blackColor].CGColor;
//sublayer.borderWidth = 2.0;
//sublayer.cornerRadius = 10.0;
//[self.view.layer addSublayer:sublayer];
