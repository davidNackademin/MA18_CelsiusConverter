//
//  CelsiusConverter.swift
//  TempConverter
//
//  Created by David Svensson on 2019-01-17.
//  Copyright © 2019 David Svensson. All rights reserved.
//

import Foundation

class CelsiusConverter {
    
    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        let degreeF = 1.8 * Double(degreesCelsius) + 32.0
        
        return Int(round(degreeF))

    }
    
}
