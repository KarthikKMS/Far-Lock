//
//  NoMacFoundViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 23/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import UIKit
import CoreLocation

class NoMacFoundViewController: UIViewController {

    // MARK: - UIViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        BeaconRangerManager.set(delegate: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MacFoundSegue" {
//            let enterPasswordViewController = segue.destination as! EnterPasswordViewController
            
        }
    }
    
    
    // MARK: - IBActions
    
    @IBAction func havingTroubleButtonPressed() {
        
    }

}


// MARK: - BeaconRangerManagerDelegate Methods

extension NoMacFoundViewController: BeaconRangerManagerDelegate {
    
    func didEnterRegion(region: CLRegion) {
        
    }
    
    func didExitRegion(region: CLRegion) {
        
    }
    
    func didRangeBeacon(beacon: CLBeacon, proximityString: String) {
        self.performSegue(withIdentifier: "MacFoundSegue", sender: self)
    }
}
