//
//  12849.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/9/24.
//

import Foundation

func stroll() {
    guard let d = readLine(),
          let intD = Int(d)
    else { return }
    if intD == 1 {
        print(0)
        return
    }

    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: intD+1), count: 8)

    dp[1][1] = 1
    dp[2][1] = 1
    for i in 2...intD {
        dp[0][i] = (dp[1][i-1] + dp[2][i-1]) % 1000000007
        dp[1][i] = (dp[0][i-1] + dp[2][i-1] + dp[3][i-1]) % 1000000007
        dp[2][i] = (dp[0][i-1] + dp[1][i-1] + dp[3][i-1] + dp[4][i-1]) % 1000000007
        dp[3][i] = (dp[1][i-1] + dp[2][i-1] + dp[4][i-1] + dp[5][i-1]) % 1000000007
        dp[4][i] = (dp[2][i-1] + dp[3][i-1] + dp[5][i-1] + dp[7][i-1]) % 1000000007
        dp[5][i] = (dp[3][i-1] + dp[4][i-1] + dp[6][i-1]) % 1000000007
        dp[6][i] = (dp[5][i-1] + dp[7][i-1]) % 1000000007
        dp[7][i] = (dp[4][i-1] + dp[6][i-1]) % 1000000007
    }

    print(dp[0][intD])
}
