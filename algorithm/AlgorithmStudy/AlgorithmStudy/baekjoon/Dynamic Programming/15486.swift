//
//  15486.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 12/15/23.
//

import Foundation

func solution15486() {
    var n: Int = Int(readLine()!)!
    var dp: [Int] = Array(repeating: 0, count: n+2)

    for i in 1...n {
        var prob = readLine()!.split(separator: " ").map{
            Int($0)!
        }
        if dp[i] < dp[i-1] {
            dp[i] = dp[i-1]
        }
        if i + prob[0] > n+1 {
            continue
        }
        if dp[i+prob[0]] < dp[i] + prob[1] {
            dp[i+prob[0]] = dp[i] + prob[1]
        }
    }
    if dp[n+1] < dp[n] {
        dp[n+1] = dp[n]
    }
    print(dp[n+1])
}
