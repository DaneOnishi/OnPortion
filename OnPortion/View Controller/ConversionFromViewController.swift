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
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.recipientButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let scanVC = storyboard.instantiateViewController(identifier: "ScanRecipientViewController") as? ScanRecipientViewController else { return }
                scanVC.defininingCalculatorRole = .source
                scanVC.modalPresentationStyle = .fullScreen
                self.present(scanVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func gramsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: gramsButton)
        
        guard let grams = ModelSingleton.shared.measurementUnits.first(where: {$0.name == "Grams"}) else {
            fatalError("Could not find grams")
        }
        
        ModelSingleton.shared.currentCalculator.add(measurement: grams, as: .source)
        
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.gramsButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentTypeValueView()
            }
        }
    }
    
    @IBAction func poundsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: poundsButton)
        
        guard let pounds = ModelSingleton.shared.measurementUnits.first(where: {$0.name == "Pounds"}) else {
            fatalError("Could not find pounds")
        }
        ModelSingleton.shared.currentCalculator.add(measurement: pounds, as: .source)
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.poundsButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentConversionToViewController()
            }
        }
    }
    
    @IBAction func millilitersButtonOnPress(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            buttonAnimation(name: self.millilitersButton)
        } completion: { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentConversionToViewController()
            }
        }
    }
    
    func presentConversionToViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let conversionToVC = storyboard.instantiateViewController(identifier: "ConversionToViewController") as? ConversionToViewController else { return }
        conversionToVC.modalPresentationStyle = .fullScreen
        self.present(conversionToVC, animated: true, completion: nil)
    }
    
    func presentTypeValueView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let typeValueVC = storyboard.instantiateViewController(identifier: "TypeValueViewController") as? TypeValueViewController else { return }
        typeValueVC.modalPresentationStyle = .fullScreen
        self.present(typeValueVC, animated: true, completion: nil)
    }
    
}

