//
//  Model.swift
//  OnPortion
//
//  Created by Daniella Onishi on 06/10/21.
//

import Foundation

class ModelSingleton {
    static let shared = ModelSingleton()
    private init() {}
    
    
    let patternMeasurementUnity = 1
    let waterDensity = 1
    
    let recipients: [Recipient] = [
        Recipient(name: "Cup", volum: 1),
        Recipient(name: "Glass", volum: 1),
        Recipient(name: "Party Cup", volum: 1),
        Recipient(name: "Spoon", volum: 1),
        Recipient(name: "Mini Spoon", volum: 1),
        Recipient(name: "Bowl", volum: 1)
    ]
    
    let ingredients: [Ingredient] = [
        Ingredient(name: "Flour", density: 2, multipliesPatternMeasurementUnityBy: 1),
        Ingredient(name: "Sugar", density: 1, multipliesPatternMeasurementUnityBy: 1),
        Ingredient(name: "Cocoa", density: 0.5, multipliesPatternMeasurementUnityBy: 1),
        Ingredient(name: "Cornstarch", density: 0.3, multipliesPatternMeasurementUnityBy: 1),
        Ingredient(name: "Milk", density: 0.1, multipliesPatternMeasurementUnityBy: 1)
    ]
    
    func calculateMaxUnits(for ingredient: Ingredient, in recipient: Recipient) -> Double {
        // Calculates how much of ingrediente can be put inside recipient
        return 0.2
    }
    
    func translate(from recipient: Recipient, toOther otherRecipient: Recipient) -> Double {
        // Returns how much times otherRecipient fills recipient
        return 0.0
    }
    
//    let glassFlour = 200
//    let oneSoupSpoonFlour = 7.5
//    let oneTeaSpoonFlour = 2.5
//    let glassCocoa = 180
//    let oneSoupSpoonCocoa = 6
//    let oneTeaSpoonCocoa = 2.5
//    let glassSugar = 360
//    let cupSugar = 180
//    let oneSoupSpoonSugar = 6
//    let oneTeaSpoonSugar = 2.5
    
}
