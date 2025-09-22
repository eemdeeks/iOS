//
//  12865.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/20/25.
//

func solution12865() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let k = input[1]
    var item: [[Int]] = [[0]]
    for _ in 0..<n {
        item.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }

    item.sort {
        if $0[0] == $1[0] {
            return $0[1] > $1[1]
        } else {
            return $0[0] < $1[0]
        }
    }

    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)
    for i in 1...n {
        for j in 0...k {
            if j - item[i][0] >= 0 {
                dp[i][j] = max(dp[i-1][j-item[i][0]]+item[i][1],dp[i-1][j])
            } else {
                dp[i][j] = dp[i-1][j]
            }
        }
    }
    print(dp[n][k])
}
