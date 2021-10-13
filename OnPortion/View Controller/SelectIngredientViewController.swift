//
//  SelectIngredientViewController.swift
//  OnPortion
//
//  Created by Daniella Onishi on 10/10/21.
//

import UIKit

class SelectIngredientViewController: UIViewController {
    @IBOutlet weak var flourButton: UIButton!
    @IBOutlet weak var sugarButton: UIButton!
    @IBOutlet weak var milkButton: UIButton!
    @IBOutlet weak var cornastarchButton: UIButton!
    @IBOutlet weak var cocoaButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func flourButtonOnPress(_ sender: Any) {
        buttonAnimation(name: flourButton)
        
        guard let ingredient = ModelSingleton.shared.ingredients.first(where: {$0.name == "Flour"}) else {
            fatalError("Could not find ingredient named Flour")
        }
        
        ModelSingleton.shared.currentCalculator.add(ingredient: ingredient, as: .source)
        
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.flourButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentConversionFrom()
            }
        }
    }
    
    @IBAction func sugarButtonOnPress(_ sender: Any) {
        
        guard let ingredient = ModelSingleton.shared.ingredients.first(where: {$0.name == "Sugar"}) else {
            fatalError("Could not find ingredient named Sugar")
        }
        
        ModelSingleton.shared.currentCalculator.add(ingredient: ingredient, as: .source)
        
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.sugarButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentConversionFrom()
            }
        }
    }
    
    @IBAction func milkButtonOnPress(_ sender: Any) {
        
        guard let ingredient = ModelSingleton.shared.ingredients.first(where: {$0.name == "Milk"}) else {
            fatalError("Could not find ingredient named Milk")
        }
        
        ModelSingleton.shared.currentCalculator.add(ingredient: ingredient, as: .source)
        
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.milkButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentConversionFrom()
            }
        }
    }
    
    @IBAction func cornstarchButtonOnPress(_ sender: Any) {
        
        
        guard let ingredient = ModelSingleton.shared.ingredients.first(where: {$0.name == "CornStarch"}) else {
            fatalError("Could not find ingredient named Cornstarch")
        }
        
        ModelSingleton.shared.currentCalculator.add(ingredient: ingredient, as: .source)
        
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.cornastarchButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentConversionFrom()
            }
        }
    }
    
    @IBAction func cocoaButtonOnPress(_ sender: Any) {
        guard let ingredient = ModelSingleton.shared.ingredients.first(where: {$0.name == "Cocoa"}) else {
            fatalError("Could not find ingredient named Cocoa")
        }
        
        ModelSingleton.shared.currentCalculator.add(ingredient: ingredient, as: .source)
        
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.cocoaButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentConversionFrom()
            }
        }
    }
    
    func presentConversionFrom() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let conversionFromVC = storyboard.instantiateViewController(identifier: "ConversionFromViewController") as? ConversionFromViewController else { return }
        conversionFromVC.modalPresentationStyle = .fullScreen
        self.present(conversionFromVC, animated: true, completion: nil)
    }
    
}

func buttonAnimation(name: UIButton) {
    UIView.animate(withDuration: 0.2) {
        name.alpha = 0
    } completion: { _ in
        UIView.animate(withDuration: 0.2) {
            name.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {name.alpha = 0
            } completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    name.alpha = 1
                }
            }
        }
    }
}
