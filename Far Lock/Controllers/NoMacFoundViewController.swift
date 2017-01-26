//
//  NoMacFoundViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 23/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import UIKit

class NoMacFoundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    // MARK: - IBActions
    
    @IBAction func havingTroubleButtonPressed() {
        // delete start
        self.performSegue(withIdentifier: "MacFoundSegue", sender: self)
        // delete end
    }

}
