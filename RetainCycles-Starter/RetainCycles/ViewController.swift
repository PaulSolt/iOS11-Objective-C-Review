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
        
        // TODO: Driver/Car Demo
        let driver = Driver(name: "Jake")
        let car = Car(make: "Prius")
        
        driver.car = car
        car.driver = driver
    }
    
    @IBOutlet var statusLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            
            
            guard let navVC = segue.destination as? UINavigationController,
                let detailVC = navVC.viewControllers.first as? DetailViewController else { return }

            
            // DetailViewController Demo (use the response closure)
            // Capture list is an array that sits in front of our variables
            detailVC.completion = { [weak detailVC] done in
                print("Done: \(done)")
                if done {
                    self.statusLabel.text = "It is done!"
                    detailVC?.dismiss(animated: false, completion: nil)
                }
                self.view.backgroundColor = .gray
            }
            
        }
    }
    
    
    deinit {
        print("ViewController.deinit")
    }
}

