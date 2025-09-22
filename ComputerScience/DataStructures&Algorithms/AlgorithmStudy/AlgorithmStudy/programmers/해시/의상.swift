//
//  의상.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 6/11/24.
//

import Foundation

func clothes(_ clothes:[[String]]) -> Int {
    var dict: [String:Int] = [:]
    var answer : Int = 1

    for cloth in clothes {
        if dict[cloth[1]] != nil {
            dict[cloth[1]]! += 1
        } else {
            dict[cloth[1]] = 1
        }
    }

    for i in dict {
        answer *= (i.value + 1)
    }

    return answer - 1
}
