//
//  10844.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 12/19/23.
//

import Foundation

func solution10844() {
    var dp: [Int] = [0,1,1,1,1,1,1,1,1,1]
    var answer: Int = 9
    let N: Int = Int(readLine()!)!

    if N > 1 {
        for _ in 2...N {
            var cache: [Int] = Array(repeating: 0, count: 10)
            answer = (answer * 2 + 40000000000 - (dp[0] + dp[9])) % 1000000000
            print(answer)
            for j in 0...9 {
                if j == 0 {
                    cache[j] = dp[1] % 1000000000
                } else if j == 9 {
                    cache[j] = dp[8] % 1000000000
                } else {
                    cache[j] = (dp[j-1] + dp[j+1]) % 1000000000
                }
            }
            dp = cache
        }
    }
    print(answer)
}
