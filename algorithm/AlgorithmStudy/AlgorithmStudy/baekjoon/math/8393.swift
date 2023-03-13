//
//  main.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/07.
//

import Foundation

func solution8393(n : Int) -> Int{
    var answer : Int = 0
    for i in 1...n{
        answer += i
    }
    return answer
}
