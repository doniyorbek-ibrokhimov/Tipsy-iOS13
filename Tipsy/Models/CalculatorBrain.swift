//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by DONIYORBEK IBROKHIMOV on 13/01/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var result:Float?
    
    mutating func calculateResult(billValue: Float, tipValue: Float, splitValue: Float) {
        
        result = (billValue * tipValue + billValue) / splitValue
        
    }
    
    func getResult() -> Float {
        return result ?? 0.0
    }
}
