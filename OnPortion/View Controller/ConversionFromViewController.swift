//
//  ConversionFromViewController.swift
//  OnPortion
//
//  Created by Daniella Onishi on 11/10/21.
//

import UIKit

class ConversionFromViewController: UIViewController {
    @IBOutlet weak var recipientButton: UIButton!
    @IBOutlet weak var gramsButton: UIButton!
    @IBOutlet weak var poundsButton: UIButton!
    @IBOutlet weak var millilitersButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func recipientButtonOnPress(_ sender: Any) {
        buttonAnimation(name: recipientButton)
    }
    
    @IBAction func gramsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: gramsButton)
    }
   
    @IBAction func poundsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: poundsButton)
    }
    
    @IBAction func millilitersButtonOnPress(_ sender: Any) {
        buttonAnimation(name: millilitersButton)
    }
    
}
