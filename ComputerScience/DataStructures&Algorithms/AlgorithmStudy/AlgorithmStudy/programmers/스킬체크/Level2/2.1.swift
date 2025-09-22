//
//  2.1.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/24/24.
//

import Foundation


func level2_1(_ s:String) -> Int{
    var answer: Int = -1
    var stack: [Character] = []

    for char in s {
        if stack.count != 0 {
            if stack[stack.count-1] == char {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        } else {
            stack.append(char)
        }
    }

    if stack.count == 0 {
        answer = 1
    } else {
        answer = 0
    }

    return answer
}
