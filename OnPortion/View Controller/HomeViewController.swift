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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3, delay: 0, options: [.autoreverse, .repeat]) {
            self.ball.frame = CGRect(x: self.ball.frame.origin.x, y: self.ball.frame.origin.y + 20, width: self.ball.frame.size.width, height: self.ball.frame.size.height
            )} completion: { _ in
                UIView.animate(withDuration: 3, delay: 0, options: [.autoreverse, .repeat]) {
                    self.ball.frame = CGRect(x: self.ball.frame.origin.x, y: self.ball.frame.origin.y - 20, width: self.ball.frame.size.width, height: self.ball.frame.size.height
                    )}
            }
    }
}
