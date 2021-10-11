//
//  Ingredient.swift
//  OnPortion
//
//  Created by Daniella Onishi on 10/10/21.
//

import Foundation

class Ingredient {
    var name: String
    var density: Double
    var multipliesPatternMeasurementUnityBy: Double
    
    internal init(name: String, density: Double, multipliesPatternMeasurementUnityBy: Double) {
        self.name = name
        self.density = density
        self.multipliesPatternMeasurementUnityBy = multipliesPatternMeasurementUnityBy
    }
}
