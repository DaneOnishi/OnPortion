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
    }
    
    @IBAction func toGramsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: toGramsButton)
    }
    
    @IBAction func toPoundsButtonOnPress(_ sender: Any) {
        buttonAnimation(name: toPoundsButton)
    }
    
    @IBAction func toMillilitersButtonOnPress(_ sender: Any) {
        buttonAnimation(name: toMillilitersButton)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
