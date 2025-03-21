//
//  17626.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/7/25.
//

func solution17626() {
    let input: Int = Int(readLine()!)!
    var dp: [Int] = Array(repeating: 0, count: input+1)
    for i in 1...input {
        var index = 1
        while index * index <= i {
            if index * index == i {
                dp[i] = 1
            } else if dp[i] == 0 {
                dp[i] = 1 + dp[i - index * index]
            } else {
                dp[i] = min(dp[i], 1 + dp[i - index * index])
            }
            index += 1
        }
    }
    print(dp[input])
}
