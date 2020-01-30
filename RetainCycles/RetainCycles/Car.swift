//
//  Car.swift
//  RetainCycles
//
//  Created by Paul Solt on 1/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

// Car is going to refer to the driver
class Car {
    var make: String
    weak var driver: Driver? // not owning
    
    init(make: String) {
        self.make = make
        print("Car.init: \(self.make)")
    }
    
    deinit {
        print("Car.deinit")
    }
}
