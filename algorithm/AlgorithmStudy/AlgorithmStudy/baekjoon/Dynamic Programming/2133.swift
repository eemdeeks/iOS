//
//  2133.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/26/25.
//

func solution2133() {
    let input: Int = Int(readLine()!)!

    if input % 2 == 1 {
        print(0)
        return
    }
    
    var dp: [Int] = Array(repeating: 0, count: input + 1)
    dp[0] = 1
    dp[2] = 3
    var sum: Int = 1
    var index = 4
    while index <= input {
        dp[index] = dp[index-2] * 3 + sum * 2
        sum += dp[index-2]

        index += 2
    }

    print(dp[input])
}
