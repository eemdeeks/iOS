//
//  2805_1.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/12/25.
//

func solution_2805() {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    
    let treeHeight: Int = input[1]

    let trees = readLine()!.components(separatedBy: " ").map { Int($0)! }

    var max: Int = trees.max()!
    var min: Int = 0
    var mid: Int {
        (max + min) / 2
    }
    var answer: Int = 0
    var sum = 0
    while min + 1 < max {
        answer = mid
        sum = trees.reduce(0, {
            ($1 - mid) > 0 ? $0 + $1 - mid: $0
        })
        if sum < treeHeight {
            max = mid
        } else {
            min = mid
        }
    }

    if sum < treeHeight {
        print(min)
    } else {
        print(max)
    }
}


