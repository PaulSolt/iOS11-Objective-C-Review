//
//  ViewController.swift
//  RetainCycles
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Driver/Car Demo
        let driver = Driver(name: "Paul")
        let car = Car(make: "Civic")
        
        driver.car = car
        car.driver = driver
        
        
    } // End of Scope (any local variable is going to be cleaned up)
    
    @IBOutlet var statusLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            
            guard let navVC = segue.destination as? UINavigationController,
                let detailVC = navVC.viewControllers.first as? DetailViewController else { return }

            
            // TODO: DetailViewController Demo (use the response closure)
            
        }
    }
    
    
    deinit {
        print("ViewController.deinit")
    }
}

