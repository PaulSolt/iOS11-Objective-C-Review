//
//  DetailViewController.swift
//  RetainCycles
//
//  Created by Paul Solt on 1/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

typealias DetailCompletion = (Bool) -> ()


class DetailViewController: UIViewController {
    
    var completion: DetailCompletion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {

        completion?(true)
//        self.dismiss(animated: false)
    }
    
    deinit {
        print("DetailViewController.deinit")
    }
    
}
