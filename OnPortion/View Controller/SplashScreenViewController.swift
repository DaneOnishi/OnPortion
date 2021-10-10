//
//  SplashScreenViewController.swift
//  OnPortion
//
//  Created by Daniella Onishi on 09/10/21.
//

import UIKit

class SplashScreenViewController: UIViewController {
    @IBOutlet weak var onPortionLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animateKeyframes(withDuration: 0.2, delay: 0.1, animations: {
            self.onPortionLogo.transform = CGAffineTransform(rotationAngle: 45)
        }, completion: { Bool in
            UIView.animateKeyframes(withDuration: 0.3, delay: 0.1) {
                self.onPortionLogo.transform = CGAffineTransform(rotationAngle: 90)
            } completion: { _ in
                UIView.animate(withDuration: 0.3,delay: 0.1) {
                    self.onPortionLogo.transform = CGAffineTransform(rotationAngle: -45)
                } completion: { _ in
                    UIView.animate(withDuration: 0.2, delay: 0.1) {
                        self.onPortionLogo.transform = CGAffineTransform(rotationAngle: 0)
                    } completion: { _ in
                        UIView.animate(withDuration: 0.2, delay: 0.3) {
                            self.onPortionLogo.alpha = 0
                        } completion: { _ in
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            guard let homeVC = storyboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController else {
                                return
                            }
                            homeVC.modalPresentationStyle = .fullScreen
                            self.present(homeVC, animated: true, completion: nil)
                        }
                    }
                }
            }
        })
    }
}
