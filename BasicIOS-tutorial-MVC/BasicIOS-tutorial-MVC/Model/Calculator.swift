//
//  Calculator.swift
//  BasicIOS-tutorial-MVC
//
//  Created by Apple on 31/07/2021.
//

import Foundation

final class Calculator {
    
    func add(a: Float, b: Float)-> Float{
        return a + b
    }
    
    func sub(a: Float, b: Float)-> Float{
        return a - b
    }
    
    func mul(a: Float, b: Float)-> Float{
        return a * b
    }
    
    func div(a: Float, b: Float)-> Float{
        if b == 0 {
            return 0
        }
        else {
            return a/b
        }
    }
    
}
