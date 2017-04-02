//
//  Song.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class Song {
    
    var tracks: [Track] = [Track]()
    
    init () {
        addDefaultTracks()
    }
    
    private func addDefaultTracks() {
        tracks.append(AudioTrack())
        tracks.append(MIDITrack())
        tracks.append(ReturnTrack())
    }
}
