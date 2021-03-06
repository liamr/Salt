//
//  PianoRollGridController.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa

class PianoRollGridController: NSViewController, PianoRollGridDataSource {
    
    
    var model = Note()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func getNotes() -> [Note] {
        return [Note]()
    }
    
    func getNotesFor(key: Int) -> [Note] {
        return getKeyTracks()[key] ?? [Note]()
    }
    
    func getKeyTracks() -> [Int : [Note]] {
        if let clip = App.current?.selectedClip as? MIDIClip {
            return clip.keyTracks
        }
        
        return [Int: [Note]]()
    }
}
