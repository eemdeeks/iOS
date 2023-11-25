//
//  solution5.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/25/23.
//

import Foundation

func solution5(_ n:Int, _ tops:[Int]) -> Int {
    var dp: [Int] = [1,2,3,5,8]
    var dp1: [Int] = [1,3,4,7,11]
    var dp2: [Int] = [1,7,4,11,15,26,41]
    for i in 4..<tops.count*2 {
        dp.append((dp[i] + dp[i-1]) % 10007)
        dp1.append((dp1[i] + dp1[i-1]) % 10007)
    }
    var answer = 0
    if tops.reduce(0, +) == 0 {
        answer = dp[n*2]
    } else if tops.reduce(0, +) == 1 {
        answer = dp1[n*2]
    }
    return answer
}
