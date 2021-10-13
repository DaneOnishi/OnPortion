//
//  ConversionCalculator.swift
//  OnPortion
//
//  Created by Daniella Onishi on 12/10/21.
//

import Foundation

enum ConversionOperation {
    /* Recipient to Recipient
     - Requires one recipient as source
     - Requires one recipient as target
     - Returns a double which is the proportion
     */
    case recipientToRecipient
    
    /* Measure to Recipient
     - Requires one ingredient as source
     - Requires one amount as source
     - Requires one unit of measure as source
     - Requires one recipient as target
     - Returns a double which is the proportion - how many target recipients we need to have that measure
     */
    case measureToRecipient
    
    /* Measure to Measure
     - Requires one unit of measure as source
     - Requires one amount as source
     - Requires one unit of measure as target
     - Returns a double which is the proportion - how many units of measure that is
     */
    case measureToMeasure
    
    /* Recipient to Measure
     - Requires one ingredient as source
     - Requires one amount as source
     - Requires one recipient as source
     - Requires one unit of measure as target
     - Returns a double which is the proportion - how many units of measure that is
     */
    case recipientToMeasure
}


class ConversionCalculator {
    
    var items: [ConversionCalculatorItem] = []
    
    func add(ingredient: Ingredient, as role: ConversionCalculatorItemRole) {
        let item = ConversionCalculatorItem(role: role, type: .ingredient, object: ingredient)
        items.append(item)
    }
    
    func add(recipient: Recipient, as role: ConversionCalculatorItemRole) {
        let item = ConversionCalculatorItem(role: role, type: .recipient, object: recipient)
        items.append(item)
    }
    
    func add(quantity: Double, as role: ConversionCalculatorItemRole) {
        let item = ConversionCalculatorItem(role: role, type: .quantity, object: quantity)
        items.append(item)
    }
    
    func add(measurement: MeasurementUnit, as role: ConversionCalculatorItemRole) {
        let item = ConversionCalculatorItem(role: role, type: .measurementUnit, object: measurement)
        items.append(item)
    }
    
    // addSomething
    func calculate(operation: ConversionOperation) -> Double? {
        switch operation {
        case .recipientToRecipient:
            guard let sourceRecipient = items.first(where: { $0.role == .source && $0.type == .recipient })?.object as? Recipient,
                  let targetRecipient = items.first(where: { $0.role == .target && $0.type == .recipient })?.object as? Recipient else {
                return nil
            }
            // Convert from source to target
            let sourceVolume = sourceRecipient.volum
            let targetVolume = targetRecipient.volum
            
            return sourceVolume / targetVolume
        case .measureToRecipient:
            guard let sourceMeasurementUnit = items.first(where: { $0.role == .source && $0.type == .measurementUnit })?.object as? MeasurementUnit,
                  let sourceIngredient = items.first(where: {$0.role == .source && $0.type == .measurementUnit})?.object as? Ingredient,
                  let sourceQuantity = items.first(where: {$0.role == .source && $0.type == .quantity})?.object as? Double,
                  let targetRecipient = items.first(where: { $0.role == .target && $0.type == .recipient })?.object as? Recipient else {
                return nil
            }
            
            // ingrediente tem densidade por grama
            // unidade de medida tem relacao com a grama
            // quantidade é quanto da unidade de medida a gente tem
            let grams = sourceQuantity * sourceMeasurementUnit.ratioToGrams
            let ingredientVolume = grams / sourceIngredient.densityPerGram
            
            // encontrar quanto volume o ingrediente ocupa
            return ingredientVolume / targetRecipient.volum
            
        case .recipientToMeasure:
            guard let sourceRecipient = items.first(where: { $0.role == .source && $0.type == .recipient })?.object as? Recipient,
                  let sourceIngredient = items.first(where: {$0.role == .source && $0.type == .measurementUnit})?.object as? Ingredient,
                  let sourceQuantity = items.first(where: {$0.role == .source && $0.type == .quantity})?.object as? Double,
                  let targetMeasurementUnit = items.first(where: { $0.role == .target && $0.type == .measurementUnit })?.object as? MeasurementUnit else {
                return nil
            }
            
            // pegamos quantos recipientes temos
            let totalRecipientVolume = sourceRecipient.volum * sourceQuantity
            
            // formula: massa = volume * densidade
            let grams = totalRecipientVolume * sourceIngredient.densityPerGram
            
            return grams / targetMeasurementUnit.ratioToGrams
            
        case .measureToMeasure:
            guard let sourceMeasurementUnit = items.first(where: { $0.role == .source && $0.type == .measurementUnit })?.object as? MeasurementUnit,
                  let sourceQuantity = items.first(where: {$0.role == .source && $0.type == .quantity})?.object as? Double,
                  let targetMeasurementUnit = items.first(where: { $0.role == .target && $0.type == .measurementUnit })?.object as? MeasurementUnit else {
                return nil
            }
            
            
        
            // Pegar coisas que tem listado lá em cima

        
        
            // Fazer operação
        default:
            return nil
        }
        return nil
    }
}


enum ConversionCalculatorItemRole {
    case source
    case target
}

enum ConversionCalculatorItemType {
    case ingredient
    case recipient
    case measurementUnit
    case quantity
}

class ConversionCalculatorItem {
    let role: ConversionCalculatorItemRole
    let type: ConversionCalculatorItemType
    let object: Any
    
    internal init(role: ConversionCalculatorItemRole, type: ConversionCalculatorItemType, object: Any) {
        self.role = role
        self.type = type
        self.object = object
    }
}
