//
//  Calculator.swift
//  Assignment1
//
//  Created by Abdelrahman  Tealab on 2020-10-11.
//

import Foundation

struct Calculator {    
    func addition(digit1: Float?,digit2: Float?) -> String {
        let result = digit1!+digit2!
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(Int(result))
        }
        else{
            return String(result)
        }
    }
    func subtraction(digit1: Float?,digit2: Float?) -> String {
        let result =  digit1!-digit2!
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(Int(result))
        }
        else{
            return String(result)
        }
    }
    func multiplication(digit1: Float?,digit2: Float?) -> String {
        let result =  digit1!*digit2!
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(Int(result))
        }
        else{
            return String(result)
        }
    }
    func division(digit1: Float?,digit2: Float?) -> String {
        let result =  digit1!/digit2!
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(Int(result))
        }
        else{
            return String(result)
        }
    }
    func percentage(digit1: Float?,digit2: Float?) -> String {
        let result =  (digit1!/100)*digit2!
        if result.truncatingRemainder(dividingBy: 1) == 0{
            return String(Int(result))
        }
        else{
            return String(result)
        }
    }
}
