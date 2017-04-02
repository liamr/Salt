//
//  App.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class App {
    static var current: App? = nil
    
    // Selections
    var selectedNote: Note? = nil
    var selectedClip: Clip? = nil
    var selectedTrack: Track? = nil
    
    var tracks: [Track]? = nil
    
    init() {
        // TODO: New file init
    }
    
    init(_ filePath: String) {
        // get file and parse into app
    }
}
