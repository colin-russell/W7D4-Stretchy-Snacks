//
//  ViewController.swift
//  W7D4 Stretchy Snacks
//
//  Created by Colin on 2018-05-24.
//  Copyright © 2018 Colin Russell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Properties
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var topViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var snackTableView: UITableView!
    
    var stackView = UIStackView()
    var titleLabel = UILabel()
    
    var snackList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.isHidden = true
        setupStackView()
        setupTitleLabel()
        
    }
    
    func setupTitleLabel() {
        titleLabel.heightAnchor.constraint(equalToConstant: 10)
        titleLabel.widthAnchor.constraint(equalToConstant: 30)
        titleLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor)
        titleLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor)
        titleLabel.textAlignment = .center
        titleLabel.text = "Snacks"
        topView.addSubview(titleLabel)
    }
    
    
    //MARK: StackView
    
    func setupStackView() {
        
        let sel = #selector(snackTapped)
        
        // Tap Gestures
        let tapGesture1 = UITapGestureRecognizer(target: self, action: sel)
        let tapGesture2 = UITapGestureRecognizer(target: self, action: sel)
        let tapGesture3 = UITapGestureRecognizer(target: self, action: sel)
        let tapGesture4 = UITapGestureRecognizer(target: self, action: sel)
        let tapGesture5 = UITapGestureRecognizer(target: self, action: sel)

        
        
        // Snack UIImageViews
        
        let snack1 = UIImageView(image: UIImage(named: "oreos"))
        snack1.heightAnchor.constraint(equalToConstant: 75).isActive = true
        snack1.widthAnchor.constraint(equalToConstant: 75).isActive = true
        snack1.addGestureRecognizer(tapGesture1)
        snack1.isUserInteractionEnabled = true
        
        let snack2 = UIImageView(image: UIImage(named: "pizzaPockets"))
        snack2.heightAnchor.constraint(equalToConstant: 75).isActive = true
        snack2.widthAnchor.constraint(equalToConstant: 75).isActive = true
        snack2.addGestureRecognizer(tapGesture2)
        snack2.isUserInteractionEnabled = true
        
        let snack3 = UIImageView(image: UIImage(named: "popTarts"))
        snack3.heightAnchor.constraint(equalToConstant: 75).isActive = true
        snack3.widthAnchor.constraint(equalToConstant: 75).isActive = true
        snack3.addGestureRecognizer(tapGesture3)
        snack3.isUserInteractionEnabled = true
        
        let snack4 = UIImageView(image: UIImage(named: "popsicle"))
        snack4.heightAnchor.constraint(equalToConstant: 75).isActive = true
        snack4.widthAnchor.constraint(equalToConstant: 75).isActive = true
        snack4.addGestureRecognizer(tapGesture4)
        snack4.isUserInteractionEnabled = true
        
        let snack5 = UIImageView(image: UIImage(named: "ramen"))
        snack5.heightAnchor.constraint(equalToConstant: 75).isActive = true
        snack5.widthAnchor.constraint(equalToConstant: 75).isActive = true
        snack5.addGestureRecognizer(tapGesture5)
        snack5.isUserInteractionEnabled = true
        
        
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
        stackView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
       
        
    }
    
    @objc func snackTapped(sender: UITapGestureRecognizer) {
        guard let snackView = sender.view as? UIImageView else {
            return
        }

        switch snackView.image {
        case UIImage(named: "oreos"):
            snackList.append("Oreos!")
        case UIImage(named: "pizzaPockets"):
            snackList.append("Pizza Pockets!")
        case UIImage(named: "popTarts"):
            snackList.append("Pop Tarts!")
        case UIImage(named: "popsicle"):
            snackList.append("Popsicle!")
        case UIImage(named: "ramen"):
            snackList.append("Ramen!")
        default:
            print("snackTap error")
        }
        snackTableView.reloadData()
    }
    
    //MARK: Actions
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
    
    //MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snackList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
        
        // Fetches the appropriate meal for the data source layout.
        let snack = snackList[indexPath.row]
        cell.textLabel?.text = snack
        return cell
    }
    
}
