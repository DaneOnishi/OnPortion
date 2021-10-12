//
//  ResultViewController.swift
//  OnPortion
//
//  Created by Daniella Onishi on 11/10/21.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var result = "\(ModelSingleton.shared.sum)"
        
    @IBOutlet weak var addToRecipeBookButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result
     
    }
    
    @IBAction func addToRecipeBookButton(_ sender: Any) {
        buttonAnimation(name: addToRecipeBookButton )
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let recipeVC = storyboard.instantiateViewController(identifier: "RecipeBookViewController") as? RecipeBookViewController else { return }
        recipeVC.modalPresentationStyle = .fullScreen
        self.present(recipeVC, animated: true, completion: nil)
    }
}
