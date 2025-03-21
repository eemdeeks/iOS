//
//  2482.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/11/25.
//

func solution2482() {
    let n: Int = Int(readLine()!)!
    let k: Int = Int(readLine()!)!
    let remainValue = 1000000003
    if n/2 < k {
        print(0)
        return
    } else if k == 1 {
        print(n)
        return
    } else {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n+1), count: k+1)
        for i in 0...n {
            dp[1][i] = i
        }
        for indexX in 2...k {
            for indexY in indexX*2...n {
                dp[indexX][indexY] = (dp[indexX][indexY-1] + dp[indexX-1][indexY-2]) % remainValue
            }
        }
        print(dp[k][n])
    }
}
