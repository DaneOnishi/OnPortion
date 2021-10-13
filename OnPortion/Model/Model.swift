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
    
    var currentCalculator = ConversionCalculator()
    
    func resetCalculator() {
        currentCalculator = ConversionCalculator()
    }
    
    private let nameTranslationMatrix: [String: String] = [
        "CopoMEJ": "Party Cup",
        "XicaraVidro": "Glass",
        "XicaraPadroes": "Cup",
        "ConchaSopa": "SoupShell",
        "Cumbuca": "Bowl",
        "ColherSopa": "Spoon",
        "ColherMini": "Mini Spoon"
        
    ]
    
    let recipients: [Recipient] = [
        Recipient(name: "Cup", volum: 1),
        Recipient(name: "Glass", volum: 2),
        Recipient(name: "Party Cup", volum: 3),
        Recipient(name: "Spoon", volum: 0.5),
        Recipient(name: "Mini Spoon", volum: 0.3),
        Recipient(name: "Bowl", volum: 5),
        Recipient(name: "SoupShell", volum: 0.8)
    ]
    
    let ingredients: [Ingredient] = [
        Ingredient(name: "Flour", density: 2),
        Ingredient(name: "Sugar", density: 1),
        Ingredient(name: "Cocoa", density: 0.5),
        Ingredient(name: "Cornstarch", density: 0.3),
        Ingredient(name: "Milk", density: 0.1)
    ]
    
    let measurementUnits: [MeasurementUnit] = [
        MeasurementUnit(name: "Grams", ratioToGrams: 1),
        MeasurementUnit(name: "Pounds", ratioToGrams: 453.592)
    ]
    
    func getRecipient(for name: String) -> Recipient? {
        let recipientName = nameTranslationMatrix[name]
        return recipients.first { recipient in
            recipient.name == recipientName
        }
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
