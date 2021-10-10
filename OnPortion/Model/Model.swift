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
    let glassFlour = 200
    let oneSoupSpoonFlour = 7.5
    let oneTeaSpoonFlour = 2.5
    let glassCocoa = 180
    let oneSoupSpoonCocoa = 6
    let oneTeaSpoonCocoa = 2.5
    let glassSugar = 360
    let cupSugar = 180
    let oneSoupSpoonSugar = 6
    let oneTeaSpoonSugar = 2.5
    

    func measureFlour() {
    
    }
    
    enum measurementRule {
        case flour
        case cocoa
        case sugar
        case cornStarch
        case milk
 
            }
        }
