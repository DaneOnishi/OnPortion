//
//  HomeViewController.swift
//  OnPortion
//
//  Created by Daniella Onishi on 09/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var ball: UIImageView!
    @IBOutlet weak var backgroundGradient: UIImageView!
    @IBOutlet weak var startButtonImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ModelSingleton.shared.resetCalculator()
    }
    @IBAction func startButtonOnPress(_ sender: Any) {
        UIView.animate(withDuration: 0.2) {
            self.startButtonImage.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.startButtonImage.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    self.startButtonImage.alpha = 0
                } completion: { _ in
                    UIView.animate(withDuration: 0.2) {
                        self.startButtonImage.alpha = 1
                    } completion: { _ in
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        guard let selectIngredientVC = storyboard.instantiateViewController(identifier: "SelectIngredientViewController") as? SelectIngredientViewController else { return }
                        selectIngredientVC.modalPresentationStyle = .fullScreen
                        self.present(selectIngredientVC, animated: true, completion: nil)
                    }
                }
            }
        }
    }
        
        override func viewDidAppear(_ animated: Bool) {
            UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat]) {
                self.ball.frame = CGRect(x: self.ball.frame.origin.x, y: self.ball.frame.origin.y + 20, width: self.ball.frame.size.width, height: self.ball.frame.size.height
                )} completion: { _ in
                    UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat]) {
                        self.ball.frame = CGRect(x: self.ball.frame.origin.x, y: self.ball.frame.origin.y - 20, width: self.ball.frame.size.width, height: self.ball.frame.size.height
                        )}
                }
        }
    }
