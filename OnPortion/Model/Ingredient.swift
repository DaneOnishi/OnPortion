//
//  Ingredient.swift
//  OnPortion
//
//  Created by Daniella Onishi on 10/10/21.
//

import Foundation

class Ingredient {
    var name: String
    var densityPerGram: Double // cm3 por grama
    
    internal init(name: String, density: Double) {
        self.name = name
        self.densityPerGram = density
    }
}
