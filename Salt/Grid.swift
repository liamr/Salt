//
//  Grid.swift
//  Salt
//
//  Created by Brian on 03/04/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class Grid {
    var snapToGrid: Bool = true
    var isTriplet: Bool = false
    var isFixed: Bool = true
    
    var zoom: Double = 1.0
    
    public private(set) var numerator: Int = 1
    var denominator: Int = 16
}

//<FixedNumerator Value="1" />
//<FixedDenominator Value="16" />
//<GridIntervalPixel Value="20" />
//<Ntoles Value="2" />
//<SnapToGrid Value="true" />
//<Fixed Value="false" />
