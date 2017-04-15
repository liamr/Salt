//
//  AudioTrack.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import AVFoundation

class AudioTrack: ClipTrack {
    override init() {
        super.init()
        
        do {
            let file = try AVAudioFile(forReading: URL(fileURLWithPath: "/Users/Brian/Desktop/2Tons.wav"))
            let player = AVAudioPlayerNode()

            App.current?.engine.attach(player)
            App.current?.engine.connect(player, to: self.mixer, format: file.processingFormat)

            player.scheduleFile(file, at: nil, completionHandler: nil)

            self.mixer.outputVolume = 0.06

            try App.current?.engine.start()
            player.play()
        }
        catch {
            
        }
    }
}
