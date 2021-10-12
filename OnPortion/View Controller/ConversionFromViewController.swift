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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let scanVC = storyboard.instantiateViewController(identifier: "ScanRecipientViewController") as? ScanRecipientViewController else { return }
        scanVC.modalPresentationStyle = .fullScreen
        self.present(scanVC, animated: true, completion: nil)
    }
    
    @IBAction func gramsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: gramsButton)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let conversionToVC = storyboard.instantiateViewController(identifier: "ConversionToViewController") as? ConversionToViewController else { return }
        conversionToVC.modalPresentationStyle = .fullScreen
        self.present(conversionToVC, animated: true, completion: nil)
    }
   
    @IBAction func poundsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: poundsButton)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let conversionToVC = storyboard.instantiateViewController(identifier: "ConversionToViewController") as? ConversionToViewController else { return }
        conversionToVC.modalPresentationStyle = .fullScreen
        self.present(conversionToVC, animated: true, completion: nil)
    }
    
    @IBAction func millilitersButtonOnPress(_ sender: Any) {
        buttonAnimation(name: millilitersButton)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let conversionToVC = storyboard.instantiateViewController(identifier: "ConversionToViewController") as? ConversionToViewController else { return }
        conversionToVC.modalPresentationStyle = .fullScreen
        self.present(conversionToVC, animated: true, completion: nil)
    }
    
}
