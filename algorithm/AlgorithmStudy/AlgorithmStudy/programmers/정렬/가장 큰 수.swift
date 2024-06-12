//
//  가장 큰 수.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 6/12/24.
//

import Foundation

func bigNum(_ numbers:[Int]) -> String {
    var prob: [String] = numbers.map{ String($0) }

    if numbers.reduce(0, +) == 0 {
        return "0"
    }
    prob.sort {
        $0 + $1 > $1 + $0
    }

    return prob.joined()
}
