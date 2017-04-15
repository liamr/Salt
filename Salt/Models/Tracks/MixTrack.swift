//
//  MixTrack.swift
//  Salt
//
//  Created by Brian on 09/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import AVFoundation

class MixTrack: Track, Nestable {
    var parent: Nestable? = nil
    
    // Node Properties
    var position: Vector2 = Vector2()
    
    var mixer: AVAudioMixerNode = AVAudioMixerNode()
    
    init() {
        App.current?.engine.attach(self.mixer)
        App.current?.engine.connect(self.mixer, to: (App.current?.master.mixer)!, format: nil)
    }
    
    func connectNode(_ to: AVAudioNode, format: AVAudioFormat?) {
        App.current?.engine.connect(self.mixer, to: to, format: format)
    }
}
