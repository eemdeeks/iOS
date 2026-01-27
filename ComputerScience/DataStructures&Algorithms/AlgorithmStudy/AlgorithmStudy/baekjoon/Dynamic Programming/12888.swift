//
//  File.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 1/27/26.
//

// dp
func solution12888() {
    guard
        let inputLine = readLine(),
        let h = Int(inputLine)
    else {
        return
    }

    switch h {
    case 0, 1:
        print(1)
    case 2:
        print(3)
    default:
        var dp: [Int] = Array(repeating: 0, count: h + 1)
        dp[0] = 1
        dp[1] = 1
        dp[2] = 3

        for i in 3...h {
            dp[i] = dp[i - 1] + 2 * dp[i - 2]
        }

        print(dp[h])
    }

}
