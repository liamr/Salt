//
//  PianoRoll.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Cocoa


@IBDesignable
class PianoRollGridView: NSView {
    
    weak var dataSource: PianoRollGridDataSource?
    
    //private var noteCache: Dictionary<UUID, PianoRollNoteView> = [:]
    
    let widthMultiplier: Double = 60.0
    let heightMultiplier: Double = 60.0
    
    var keyWidth: Double = 50.0 {
        didSet { setNeedsDisplay(bounds) }
    }
    
    var keyHeight: Double = 20 {
        didSet { setNeedsDisplay(bounds) }
    }
    
    var gridWidth: Double = 1
    

    
    /// # TODO
    /// - RENAME THESE - This one resizes the view and grid together maintaining ratio
    @IBAction func scaleWidth(sender: NSSlider) {
        self.frame = NSRect(x: 0, y: 0, width: CGFloat(sender.doubleValue * 4000), height: self.frame.height)
        gridWidth = Double(self.frame.width) / App.current!.selectedClip!.timeSignature.denominator
        
        setNeedsDisplay(bounds)
    }
    
    @IBAction func updateWidth(sender: NSSlider) {
        keyWidth = sender.doubleValue * widthMultiplier
    }
    
    // TODO: RENAME THESE - This one resizes the view and grid together maintaining ratio
    // TODO: Not working
    @IBAction func scaleHeight(sender: NSSlider) {
        self.frame = NSRect(x: 0, y: 0, width: self.frame.width, height: CGFloat(sender.doubleValue * 4000))
        keyHeight = Double(self.frame.height / CGFloat(128.0))
        
        setNeedsDisplay(bounds)
    }
    
    // TODO: RENAME THESE - This one resizes the view
    @IBAction func setHeight(sender: NSSlider) {
        self.frame = NSRect(x: 0, y: 0, width: self.frame.width, height: CGFloat(sender.doubleValue))
        setNeedsDisplay(bounds)
    }
    
    // TODO: RENAME THESE - This one resizes the grid res
    @IBAction func updateHeight(sender: NSSlider) {
        keyHeight = sender.doubleValue * heightMultiplier
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        self.wantsLayer = true
        self.needsDisplay = true
    }

    // Drawing
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        //withinHeightRange = (keyHeight * 128) >= Double(dirtyRect.height)
        
        // Init
        layer?.backgroundColor = App.current?.theme.pianoRoll.background.cgColor
        
        drawgrid(dirtyRect)
        drawNotes(dirtyRect)

    }
    
    func drawgrid(_ rect: NSRect) {
        
        // Set Colours
        // TODO: Move these to theme
        NSColor(deviceRed: 0, green: 0, blue: 0, alpha: 0.2).setFill()
        NSColor(deviceRed: 0, green: 0, blue: 0, alpha: 0.15).setStroke()
        
        drawHorizontals(rect)
        
        if let _ = App.current?.selectedClip?.grid.isFixed {
            drawVerticalGridLines(rect)
        }
        else {
            // TODO Implement Dynamic Grid
        }
        
    }
    
    func drawVerticalGridLines(_ rect: NSRect) {
        let width: Int = Int(frame.width)
        
        for i in 0...width {
            if Double(i).truncatingRemainder(dividingBy: round(gridWidth)) == 0 {
                NSBezierPath.strokeLine(from: NSMakePoint(CGFloat(i), 0), to: NSMakePoint(CGFloat(i), frame.height))
            }
        }
    }
    
    func drawHorizontals(_ rect: NSRect) {
        
        let width: Int = Int(frame.width)
        Swift.print(width)
        var keyCounter = 0
        for i in 0...127 {
            
            let yPos: Double = (Double(i) + 1) * keyHeight
            
            if isBlackKey(key: keyCounter) {
                
                // Draw Note
                drawKey(rect, key: i, isBlackKey: true)
                
                // Draw Note Track Bars
                let noteTrackRect = NSBezierPath(rect: NSRect(x: 0, y: yPos-keyHeight, width: Double(width), height: keyHeight))
                
                noteTrackRect.stroke()
                noteTrackRect.fill()
                
            } else {
                
                // Draw Note
                drawKey(rect, key: i, isBlackKey: true)
                
                if !isBlackKey(key: i+1) {
                    // Just Draw Strokes
                    NSBezierPath.strokeLine(from: NSMakePoint(0, CGFloat(yPos)), to: NSMakePoint(frame.width, CGFloat(yPos)))
                }
            }
            
            keyCounter = keyCounter >= 11 ? 0 : keyCounter + 1
        }
    }
    
    func drawNotes (_ rect: NSRect) {
        // NOTE: Performance wise it might be better to do this all in one pass and move the loops to the draw rect in which the
        
//        for (key, notes) in (dataSource?.getNotes())! {
//            
//            let yPos: Double = Double((key + 1) * Int(keyHeight))
//            
//            for note in notes {
//                let xStartPos: Double = note.time
//                let xEndPos: Double = note.duration
//                
//                if noteCache[note.id] == nil {
//                    let noteView = PianoRollNoteView(frame: NSRect(x: xStartPos, y: yPos-keyHeight, width: xEndPos, height: keyHeight))
//                    
//                    noteView.note = note
//                    noteView.noteIndex = key
//                    
//                    addSubview(noteView)
//                    noteCache[note.id] = noteView
//                } else {
//                    noteCache[note.id]?.frame = NSRect(x: xStartPos, y: yPos-keyHeight, width: xEndPos, height: keyHeight)
//                }
//                
//            }
//        }
    }
    
    func drawKey (_ rect: NSRect, key: Int, isBlackKey: Bool) {
        //        let keyRect = NSBezierPath(rect: NSRect(x: 0, y: yPos-Int(keyHeight), width: width, height: Int(keyHeight)))
        //
        //        keyRect.stroke()
        //        keyRect.fill()
    }
    
    // Utility
    func isBlackKey (key: Int) -> Bool {
        return key == 1 || key == 3 || key == 6 || key == 8 || key == 10
    }
    
    func getRatio(_ gridRes: Double, _ width: CGFloat) -> Double {
        return gridRes / Double(width)
    }
}
