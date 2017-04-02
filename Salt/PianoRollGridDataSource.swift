//
//  PianoRollGridDataSource.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

protocol PianoRollGridDataSource: class {
    func getNotes() -> [Note]
}
