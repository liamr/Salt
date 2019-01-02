
//
//  PianoRollGridViewDelegate.swift
//  Salt
//
//  Created by Brian on 02/01/2019.
//  Copyright © 2019 Iko. All rights reserved.
//

import Foundation

protocol PianoRollGridViewDelegate: class {
    // SELECTION:
    func gridView(_ view: PianoRollGridView, willSelectNoteAt key: Int, andTime: Double)
    func gridView(_ view: PianoRollGridView, didSelectNoteAt key: Int, andTime: Double)
    
    // DESELECTION
//    func gridView(_ view: PianoRollGridView, willDeselectNoteAt key: Int, andTime: Double)
//    func gridView(_ view: PianoRollGridView, didDeselectNoteAt key: Int, andTime: Double)
}
