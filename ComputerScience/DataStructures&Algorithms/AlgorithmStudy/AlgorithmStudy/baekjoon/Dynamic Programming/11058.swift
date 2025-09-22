//
//  11058.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 12/18/23.
//

import Foundation

func solution11058() {
    var dp: [Int] = [0,1,2,3,4,5,6,9,12,16,20,27,36,48,64,81]

    let N: Int = Int(readLine()!)!

    if N > 15 {
        for i in 16...N {
            dp.append(dp[i-5] * 4)
        }
    }
    print(dp[N])
}
