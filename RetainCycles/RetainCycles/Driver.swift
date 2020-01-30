//
//  Driver.swift
//  RetainCycles
//
//  Created by Paul Solt on 1/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

// Driver is going to own the car
class Driver {
    
    // all variables are going to default to
    // strong references
    var name: String
    var car: Car?
    
    init(name: String) {
        self.name = name
        print("Driver.init: \(self.name)")
    }
    
    deinit {
        print("Driver.deinit")
    }
}
