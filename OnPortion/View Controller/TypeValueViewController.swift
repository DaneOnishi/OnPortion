//
//  TypeValueViewController.swift
//  OnPortion
//
//  Created by Daniella Onishi on 11/10/21.
//

import UIKit

class TypeValueViewController: UIViewController {
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonOnPress(_ sender: Any) {
        buttonAnimation(name: continueButton)
    }
}
