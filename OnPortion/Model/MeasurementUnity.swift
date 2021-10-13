//
//  MeasurementUnity.swift
//  OnPortion
//
//  Created by Daniella Onishi on 12/10/21.
//

import Foundation

class MeasurementUnit {
    let name: String
    let ratioToGrams: Double
    
    internal init(name: String, ratioToGrams: Double) {
        self.name = name
        self.ratioToGrams = ratioToGrams
    }
}
