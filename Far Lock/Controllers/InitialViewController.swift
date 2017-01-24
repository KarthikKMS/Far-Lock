//
//  InitialViewController.swift
//  Far Lock
//
//  Created by Karthik M S on 23/01/17.
//  Copyright © 2017 Karthik M S. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //
        let loadFirstStoryboard: Bool = true
        if loadFirstStoryboard {
            let firstStoryboard: UIStoryboard = UIStoryboard.init(name: "SearchingStoryboard", bundle: nil)
            let initialViewController: UIViewController = firstStoryboard.instantiateInitialViewController()!
            self.present(initialViewController, animated: false, completion: nil)
        }
        else {
            
        }
        //
    }

}
