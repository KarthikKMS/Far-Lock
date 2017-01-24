//
//  EnterPasswordViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 23/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import UIKit

class EnterPasswordViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var rootStackView: UIStackView!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var wrongPasswordView: UIView!
    @IBOutlet weak var tryAgainButton: UIButton!
    
    @IBOutlet weak var correctPasswordView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    
    // MARK: - ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        connectButton.layer.borderColor = UIColor.white.cgColor
        cancelButton.layer.borderColor = UIColor.white.cgColor
        tryAgainButton.layer.borderColor = UIColor.white.cgColor
        continueButton.layer.borderColor = UIColor.white.cgColor
    }
    
    
    // MARK: - IBActions
    
    @IBAction func connectButtonPressed(_ sender: UIButton) {
        rootStackView.alpha = 0.1
        
        // delete
        correctPasswordView.isHidden = false
        // delete
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
    
    }
    
    @IBAction func tryAgainButtonPressed(_ sender: UIButton) {
        rootStackView.alpha = 1
        wrongPasswordView.isHidden = true
    }

    @IBAction func continueButtonPressed(_ sender: UIButton) {
        
    }

}
