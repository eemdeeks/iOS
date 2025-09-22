//
//  1074.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/10/25.
//


func solution1074() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    var x = input[1]
    var y = input[2]
    var answer = 0
    var num = (0..<n).reduce(1) { before, _ in
        before * 2
    }

    while num > 1 {
        let mid: Int = num / 2
        var position = 0
        if x < mid {
            if y < mid {
                position = 0
            } else {
                position = 1
                y -= mid
            }
        } else {
            if y < mid {
                position = 2
            } else {
                position = 3
                y -= mid
            }
            x -= mid
        }

        answer += num * num * position / 4

        num /= 2
    }

    print(answer)
}
