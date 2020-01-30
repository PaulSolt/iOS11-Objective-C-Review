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
        
                // DetailViewController Demo (use the response closure)
                // Capture list is an array that sits in front of our variables
                detailVC.completion = { [weak detailVC] done in
//            detailVC.completion = { [unowned detailVC] done in

                    print("Done: \(done)")
                    
                    // Update status label?
                    if done {
//                        self.navigationController?.popToViewController(self, animated: true)
                        detailVC?.dismiss(animated: true)
                        self.statusLabel.text = "It is done!"
                    }
                    self.view.backgroundColor = .green
                }
            
        }
    }
    
//    func closure(done: Bool, detailVC: DetailViewController, viewController: ViewController) {
//        print("Done: \(done)")
//
//        // Update status label?
//        if done {
////                        self.navigationController?.popToViewController(self, animated: true)
//            detailVC?.dismiss(animated: true)
//            self?.statusLabel.text = "It is done!"
//        }
//    }
    
    
    
    
    deinit {
        print("ViewController.deinit")
    }
}

