//
//  MasterTrack.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class MasterTrack: MixTrack {
    override init(){
        super.init()
        App.current?.engine.connect(self.mixer, to: (App.current?.engine.mainMixerNode)!, format: nil)
    }
}
