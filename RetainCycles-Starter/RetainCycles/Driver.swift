//
//  Driver.swift
//  RetainCycles
//
//  Created by Paul Solt on 1/30/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation

class Driver {
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
