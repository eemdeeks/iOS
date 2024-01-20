//
//  targetNumber.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 1/20/24.
//

import Foundation

func targetNumber(_ numbers:[Int], _ target:Int) -> Int {
    var cache: [[Int]] = [[numbers[0],-numbers[0]]]
    var answer: Int = 0

    for index in 1..<numbers.count {
        var arr: [Int] = []
        for i in cache[index-1]{
            arr.append(i+numbers[index])
            arr.append(i-numbers[index])
        }
        cache.append(arr)
    }
    print(cache)
    for i in cache[numbers.count-1] {
        if i == target { answer += 1}
    }

    return answer
}
