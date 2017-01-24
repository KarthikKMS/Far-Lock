//
//  LockConfigurationViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 24/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import UIKit

class LockConfigurationViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var rootStackView: UIStackView!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var lockStatusLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var farLockSwitch: UISwitch!
    
    @IBOutlet weak var lockUnlockDistanceLabel: UILabel!
    
    @IBOutlet weak var distanceSlider: UISlider!
    @IBOutlet weak var unpairButton: UIButton!
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var okButton: UIButton!
    
    
    // MARK: - ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        infoButton.layer.borderColor = UIColor.white.cgColor
        lockUnlockDistanceLabel.layer.borderColor = UIColor.white.cgColor
        unpairButton.layer.borderColor = UIColor.white.cgColor
        okButton.layer.borderColor = UIColor.white.cgColor
    }

    
    // MARK: - IBActions

    @IBAction func infoButtonPressed(_ sender: UIButton) {
        infoView.isHidden = false
        rootStackView.alpha = 0.1
    }
    
    @IBAction func farLockSwitchValueChanged(_ sender: UISwitch) {
    
    }
    
    @IBAction func distanceSliderValueChanged(_ sender: UISlider) {
        
    }
    
    @IBAction func okButtonPressed(_ sender: UIButton) {
        infoView.isHidden = true
        rootStackView.alpha = 1
    }
    
}
