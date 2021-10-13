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
        guard let scanVC = storyboard.instantiateViewController(identifier: "ScanRecipientViewController") as? ScanRecipientViewController else { return }
        scanVC.defininingCalculatorRole = .target
        scanVC.modalPresentationStyle = .fullScreen
        self.present(scanVC, animated: true, completion: nil)
    }
    
    @IBAction func toGramsButtonOnPress(_ sender: Any) {
        
        
        guard let grams = ModelSingleton.shared.measurementUnits.first(where: {$0.name == "Grams"}) else {
            fatalError("Could not find recipient")
        }
        
        ModelSingleton.shared.currentCalculator.add(measurement: grams, as: .target)
      
        
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.toGramsButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentTypeValueView()
            }
        }
    }
    
    @IBAction func toPoundsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: toPoundsButton)
        presentTypeValueView()
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.toPoundsButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentTypeValueView()
            }
        }
    }
    
    @IBAction func toMillilitersButtonOnPress(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.toMillilitersButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentTypeValueView()
            }
        }
    }
    
    func presentTypeValueView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let typeValueVC = storyboard.instantiateViewController(identifier: "TypeValueViewController") as? TypeValueViewController else { return }
        typeValueVC.modalPresentationStyle = .fullScreen
        self.present(typeValueVC, animated: true, completion: nil)
    }
}
