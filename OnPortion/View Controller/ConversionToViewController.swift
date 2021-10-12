//
//  ConversionToViewController.swift
//  OnPortion
//
//  Created by Daniella Onishi on 11/10/21.
//

import UIKit

class ConversionToViewController: UIViewController {
    @IBOutlet weak var toRecipientButton: UIButton!
    @IBOutlet weak var toGramsButton: UIButton!
    @IBOutlet weak var toPoundsButton: UIButton!
    @IBOutlet weak var toMillilitersButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toRecipientButtonOnPress(_ sender: Any) {
        buttonAnimation(name: toRecipientButton)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let typeValueVC = storyboard.instantiateViewController(identifier: "TypeValueViewController") as? TypeValueViewController else { return }
        typeValueVC.modalPresentationStyle = .fullScreen
        self.present(typeValueVC, animated: true, completion: nil)
    }
    
    @IBAction func toGramsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: toGramsButton)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let typeValueVC = storyboard.instantiateViewController(identifier: "TypeValueViewController") as? TypeValueViewController else { return }
        typeValueVC.modalPresentationStyle = .fullScreen
        self.present(typeValueVC, animated: true, completion: nil)
    }
    
    @IBAction func toPoundsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: toPoundsButton)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let typeValueVC = storyboard.instantiateViewController(identifier: "TypeValueViewController") as? TypeValueViewController else { return }
        typeValueVC.modalPresentationStyle = .fullScreen
        self.present(typeValueVC, animated: true, completion: nil)
    }
    
    @IBAction func toMillilitersButtonOnPress(_ sender: Any) {
        buttonAnimation(name: toMillilitersButton)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let typeValueVC = storyboard.instantiateViewController(identifier: "TypeValueViewController") as? TypeValueViewController else { return }
        typeValueVC.modalPresentationStyle = .fullScreen
        self.present(typeValueVC, animated: true, completion: nil)
    }
}
