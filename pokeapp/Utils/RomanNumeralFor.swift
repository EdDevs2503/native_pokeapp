//
//  RomanNumeralFor.swift
//  pokeapp
//
//  Created by Edisson Mata on 26/8/23.
//

import Foundation

enum Errors: Error {
    case NotValidFormat
}

func RomanNumeralFor(_ s: String) throws -> Int {
    let dict: [Character : Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]

    var history: [Int] = []
    var substracted = false
    var repCount = 0
    var index = 0
    let reversedS = String(s.reversed())
    
    for char in reversedS {
        guard let currentVal = dict[char] else {
            throw Errors.NotValidFormat
        }
        var nextVal: Int? = nil
        
        if (index < s.count - 1) {
            nextVal = dict[reversedS[reversedS.index(reversedS.startIndex, offsetBy: index + 1)]]
        }
        
        if (!substracted) {
            history.append(currentVal)
        } else {
            substracted.toggle()
        }
        if (nextVal != nil) {
            if (currentVal > nextVal!) {
                if (nextVal == 1 || nextVal == 10 || nextVal == 100) {
                    history.popLast()
                    history.append(currentVal - nextVal!)
                    substracted.toggle()
                } else {
                    throw Errors.NotValidFormat
                }
            }
            if (currentVal == nextVal) {
                repCount += 1
                if (repCount > 3) {
                    throw Errors.NotValidFormat
                }
            }
        }
        
        index += 1
    }
    
    return history.reduce(0) { $0 + $1 }
}

