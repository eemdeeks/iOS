//
//  7579.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/21/25.
//
import Foundation

func solution7579() {
    let input1 = readLine()!.split(separator: " ").map { Int(String($0))!}
    let n = input1[0]
    let m = input1[1]
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))!}
    let input3 = readLine()!.split(separator: " ").map { Int(String($0))!}

    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10001), count: n+1)

    for i in 0..<n {
        for y in 0...10000 {
            if y-input3[i] < 0 {
                dp[i+1][y] = dp[i][y]
            } else {
                dp[i+1][y] = max(dp[i][y], dp[i][y-input3[i]] + input2[i])
            }
        }
    }

    var answer = 10000
    for i in dp {
        for value in 0...10000 {
            if i[value] >= m && answer > value {
                answer = value
            }
        }
    }

    print(answer)
}
