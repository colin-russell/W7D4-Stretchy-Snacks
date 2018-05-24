//
//  ViewController.swift
//  W7D4 Stretchy Snacks
//
//  Created by Colin on 2018-05-24.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    
    
    
    var navBarIsOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
    }
    
    func setupStackView() {
        
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        var transformHeight: CGFloat = 200.0
        var transformAngle: CGFloat = 0.25
        if topView.frame.height == 200 {
            transformHeight = 66.0
            transformAngle = 0.5
        }
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
                self.topView.frame = CGRect(
                    x: self.topView.frame.origin.x,
                    y: self.topView.frame.origin.y,
                    width: self.topView.frame.width,
                    height: transformHeight
                )
                self.plusButton.transform = CGAffineTransform(rotationAngle: transformAngle*CGFloat.pi)
            }) { (complete) in
                if (complete) {
                    print("animation complete")
                }
            }
        
    }
    
}

