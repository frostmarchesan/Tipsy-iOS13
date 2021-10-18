//
//  TipCalculator.swift
//  Tipsy
//
//  Created by Virtual Machine on 13/10/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipCalculator {
    
    var tip : Float?
    var percentage: Float?
    var amount: Float = 0.0
    var people: Float = 0.0
    
    mutating func getTip() -> Float {
        self.tip = amount * (percentage ?? 0.0 / 100)
        return tip ?? 0.0
    }
    
    mutating func getTotalAmount() -> Float {
        let totalAmount = amount + getTip()
        return totalAmount
    }
    
    mutating func getSplitAmount() -> Float {
        let split = getTotalAmount() / people
        return split
    }
    
    mutating func setPeople (number: Float) {
        self.people = number
    }
    
}
