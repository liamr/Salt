//
//  DoubleExtensions.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

extension Double {
    func lerp(_ v1: Double, _ t: Double) -> Double {
        return (1 - t) * self + t * v1
    }
}
