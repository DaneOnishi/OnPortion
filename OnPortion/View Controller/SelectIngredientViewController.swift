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
    }
    
    @IBAction func sugarButtonOnPress(_ sender: Any) {
        buttonAnimation(name: sugarButton)
    }
    
    @IBAction func milkButtonOnPress(_ sender: Any) {
        buttonAnimation(name: milkButton)
    }
    
    @IBAction func cornstarchButtonOnPress(_ sender: Any) {
        buttonAnimation(name: cornastarchButton)
    }
    
    @IBAction func cocoaButtonOnPress(_ sender: Any) {
        buttonAnimation(name: cocoaButton)
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
