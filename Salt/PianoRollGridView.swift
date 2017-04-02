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
    
    var backgroundColour: NSColor = NSColor(deviceRed:0.16, green:0.17, blue:0.21, alpha:1.00) {
        didSet { setNeedsDisplay(bounds)}
    }
    
    var keyWidth: Double = 50.0 {
        didSet { setNeedsDisplay(bounds) }
    }
    
    var keyHeight: Double = 20 {
        didSet { setNeedsDisplay(bounds) }
    }
    
    @IBAction func updateWidth(sender: NSSlider) {
        keyWidth = sender.doubleValue
    }
    
    @IBAction func updateHeight(sender: NSSlider) {
        keyHeight = sender.doubleValue
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        self.wantsLayer = true
        self.needsDisplay = true
        
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Init
        layer?.backgroundColor = backgroundColour.cgColor
        
        drawgrid(dirtyRect)
        drawNotes(dirtyRect)

    }
    
    func drawgrid(_ rect: NSRect) {
        
        // Set Colours
        NSColor(deviceRed: 0, green: 0, blue: 0, alpha: 0.2).setFill()
        NSColor(deviceRed: 0, green: 0, blue: 0, alpha: 0.15).setStroke()
        
        drawHorizontals(rect)
        
//        if App.instance.currentClip.grid.isFixed {
//            drawVerticalGridLines(rect)
//        }
//        else {
//            // TODO Implement Dynamic Grid
//        }
        
    }
    
    func drawVerticalGridLines(_ rect: NSRect) {
//        let width: Int = Int(frame.width)
//        let gridWidth: Double = Double((superview?.bounds.width)!) / App.current!.selectedClip!.timeSignature.denominator
//        
//        
//        for i in 0...width {
//            if Double(i).truncatingRemainder(dividingBy: round(gridWidth)) == 0 {
//                NSBezierPath.strokeLine(from: NSMakePoint(CGFloat(i), 0), to: NSMakePoint(CGFloat(i), frame.height))
//            }
//        }
        
    }
    
    func drawHorizontals(_ rect: NSRect) {
        
        let width: Int = Int(frame.width)
        
        var keyCounter = 0
        for i in 0...127 {
            
            let yPos: Int = (i + 1) * Int(keyHeight)
            
            if isBlackKey(key: keyCounter) {
                // Draw Note
                drawKey(rect, key: i, isBlackKey: true)
                
                // Draw Note Track Bars
                let noteTrackRect = NSBezierPath(rect: NSRect(x: 0, y: yPos-Int(keyHeight), width: width, height: Int(keyHeight)))
                
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
    
    func isBlackKey (key: Int) -> Bool {
        return key == 1 || key == 3 || key == 6 || key == 8 || key == 10
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
}
