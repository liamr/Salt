//
//  CGFloatExtensions.swift
//  Salt
//
//  Created by Brian on 02/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

extension CGFloat {
    func lerp(_ v1: CGFloat, _ t: CGFloat) -> CGFloat {
        return (1 - t) * self + t * v1
    }
}
