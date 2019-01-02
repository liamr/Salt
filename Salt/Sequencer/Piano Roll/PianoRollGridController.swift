//
//  PianoRollGridController.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa

class PianoRollGridController: NSViewController, PianoRollGridViewDelegate, PianoRollGridDataSource {
    
    var selectedNotes = [Int: [Note]]()
    
    @IBOutlet weak var pianoRollGridView: PianoRollGridView! {
        didSet {
            pianoRollGridView.delegate = self
            pianoRollGridView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // DataSource Methods
    func getNotes() -> [Note] {
        return getKeyTracks().flatMap({ $0.value })
    }
    
    func getNotesFor(key: Int) -> [Note] {
        return getKeyTracks()[key] ?? [Note]()
    }
    
    func getNoteFor(_ key: Int, atTime time: Double) -> (key: Int, note: Note)? {
        let notes = getNotesFor(key: key)
        let note = notes.first(where: { $0.time < time && $0.time + $0.duration > time })
        
        return note != nil ? (key: 40, note: note!) : nil
    }
    
    func getKeyTracks() -> [Int : [Note]] {
        if let clip = App.current?.selectedClip as? MIDIClip {
            return clip.keyTracks
        }
        
        return [Int: [Note]]()
    }
    
    // Delegate Methods
    func gridView(_ view: PianoRollGridView, willSelectNoteAt key: Int, andTime time: Double) {
        let note = getNoteFor(key, atTime: time)
        
        if let x = note {
            selectedNotes = [x.key : [x.note]]
        }
    }
    
    func gridView(_ view: PianoRollGridView, didSelectNoteAt key: Int, andTime: Double) {
        // TODO: PLAY NOTE
        print(selectedNotes)
    }
}
