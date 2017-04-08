//
//  Nestable.swift
//  Salt
//
//  Created by Brian on 06/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

protocol Nestable {
    var parent: Nestable? { get set }
}
