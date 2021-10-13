//
//  ResultViewController.swift
//  OnPortion
//
//  Created by Daniella Onishi on 11/10/21.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var addToRecipeBookButton: UIButton!
    
    let calculator = ModelSingleton.shared.currentCalculator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let value = calculator.calculate(operation: .recipientToRecipient),
           let sourceRecipient = calculator.items.first(where: { $0.role == .source && $0.type == .recipient })?.object as? Recipient,
           let targetRecipient = calculator.items.first(where: { $0.role == .target && $0.type == .recipient })?.object as? Recipient {
            resultLabel.text = "Conversion from \(sourceRecipient.name) to \(targetRecipient.name) is \(value)"
           
        } else if let value = calculator.calculate(operation: .measureToMeasure) {
            
        } else if let value = calculator.calculate(operation: .recipientToMeasure) {
            
        } else if let value = calculator.calculate(operation: .measureToRecipient) {
            
        }
     
    }
    
    @IBAction func addToRecipeBookButton(_ sender: Any) {
        buttonAnimation(name: addToRecipeBookButton )
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let recipeVC = storyboard.instantiateViewController(identifier: "RecipeBookViewController") as? RecipeBookViewController else { return }
        recipeVC.modalPresentationStyle = .fullScreen
        self.present(recipeVC, animated: true, completion: nil)
    }
}
