//
//  Engine.swift
//  Salt
//
//  Created by Brian on 09/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import AVFoundation

class Engine: AVAudioEngine {
    override init() {
        super.init()
        
        do {
            let file = try AVAudioFile(forReading: URL(fileURLWithPath: "/Users/Brian/Desktop/2Tons.wav"))
            let player = AVAudioPlayerNode()
            
            self.attach(player)
            self.connect(player, to: self.mainMixerNode, format: file.processingFormat)
            
            player.scheduleFile(file, at: nil, completionHandler: nil)
            
            self.mainMixerNode.outputVolume = 0.06
                        
            try self.start()
            player.play()
        }
        catch {
            
        }
        
        //self.mainMixerNode.
    }
}
