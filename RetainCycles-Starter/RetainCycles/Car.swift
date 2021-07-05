//
//  Car.swift
//  RetainCycles
//
//  Created by Paul Solt on 1/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

// Car will refer to the driver
class Car {
    
    var make: String
    weak var driver: Driver?
    
    init(make: String) {
        self.make = make
        print("Car.init: \(self.make)")
    }
    
    deinit {
        print("Car.deinit")
    }
}
