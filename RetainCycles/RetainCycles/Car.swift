//
//  Car.swift
//  RetainCycles
//
//  Created by Paul Solt on 1/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

class Car {
    var make: String
    var driver: Driver?
    
    init(make: String) {
        self.make = make
        print("Car.init: \(self.make)")
    }
    
    deinit {
        print("Car.deinit")
    }
}
