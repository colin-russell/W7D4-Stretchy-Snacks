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
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    
    var stackView = UIStackView()
    var titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.isHidden = true
        setupStackView()
        setupTitleLabel()
    }
    
    func setupTitleLabel() {
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//        label.center = CGPoint(x: 160, y: 285)
//        label.textAlignment = .center
//        label.text = "I'am a test label"
//        self.view.addSubview(label)
        
        titleLabel.heightAnchor.constraint(equalToConstant: 10)
        titleLabel.widthAnchor.constraint(equalToConstant: 30)
        titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor)
        titleLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor)
        titleLabel.textAlignment = .center
        titleLabel.text = "Snacks"
        topView.addSubview(titleLabel)
    }
    
    func setupStackView() {
        
        let snack1 = UIImageView(image: UIImage(named: "oreos"))
        snack1.heightAnchor.constraint(equalToConstant: 75).isActive = true
        snack1.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        
        let snack2 = UIImageView(image: UIImage(named: "pizzaPockets"))
        snack2.heightAnchor.constraint(equalToConstant: 75).isActive = true
        snack2.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        let snack3 = UIImageView(image: UIImage(named: "popTarts"))
        snack3.heightAnchor.constraint(equalToConstant: 75).isActive = true
        snack3.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        let snack4 = UIImageView(image: UIImage(named: "popsicle"))
        snack4.heightAnchor.constraint(equalToConstant: 75).isActive = true
        snack4.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        let snack5 = UIImageView(image: UIImage(named: "ramen"))
        snack5.heightAnchor.constraint(equalToConstant: 75).isActive = true
        snack5.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        
        stackView.axis  = .horizontal
        stackView.distribution  = .equalSpacing
        stackView.alignment = .center
        stackView.spacing   = 5.0
        
        stackView.addArrangedSubview(snack1)
        stackView.addArrangedSubview(snack2)
        stackView.addArrangedSubview(snack3)
        stackView.addArrangedSubview(snack4)
        stackView.addArrangedSubview(snack5)
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        
        
        self.topView.addSubview(stackView)
        
        //Constraints
        stackView.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
       
        
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        var transformHeight: CGFloat = 200.0
        var transformAngle: CGFloat = 0.25
        
        if self.topView.frame.height == 200 {
            transformHeight = 66.0
            transformAngle = 0.5
            self.stackView.isHidden = true

        } else {
            self.stackView.isHidden = false
        }
       topViewHeightConstraint.constant = transformHeight
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.25, options: [], animations: {[weak self] in
            
            self?.plusButton.transform = CGAffineTransform(rotationAngle: transformAngle*CGFloat.pi)
            self?.view.layoutIfNeeded()
        }) { (complete) in
            if (complete) {
                print("animations complete")
            }
        }
        
    }
    
}

