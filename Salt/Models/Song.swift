//
//  Song.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class Song {
    
    // Tracks
    var tracks: [Track] = [Track]()
    var returnTracks: [ReturnTrack] = [ReturnTrack]()
    var masterTrack: MasterTrack = MasterTrack()
    
    // Global
    var tempo: Double = 120.0
    var timeSignature = TimeSignature()
    
    // Playhead
    var currentSongTime: Double = 0.0
    var isPlaying: Bool = false
    
    // Loop
    var loop: Bool = false
    var loopStart: Double = 0.0
    var loopLength: Double = 0.0
    
    
    init () {
        addDefaultTracks()
    }
    
    private func addDefaultTracks() {
        tracks.append(AudioTrack())
        tracks.append(MIDITrack())
        
        returnTracks.append(ReturnTrack())
    }
}
