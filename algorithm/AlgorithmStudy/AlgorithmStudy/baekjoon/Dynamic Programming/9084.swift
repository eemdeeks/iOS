//
//  9084.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 8/22/25.
//


func solution9084() {
    let fileIO = FileIO()

    let t = fileIO.readInt()

    for _ in 0..<t {
        let n = fileIO.readInt()
        var coins: [Int] = []

        for _ in 0..<n {
            coins.append(fileIO.readInt())
        }

        let m = fileIO.readInt()

        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 1), count: coins.count + 1)

        for i in 0..<coins.count {
            for j in 0...m {
                if coins[i] > j {
                    dp[i + 1][j] = dp[i][j]
                } else if coins[i] == j {
                    dp[i + 1][j] = dp[i][j] + 1
                } else {
                    dp[i + 1][j] = dp[i][j] + dp[i + 1][j - coins[i]]
                }
            }
        }

        print(dp[coins.count][m])
    }
}

//    0, 1, 2, 3, 4, 5,       6, 7, 8, 9, 10,     11, 12,     13,     14,     15,     16,     17,     18,     19,     20,     21,     22
//    0, 0, 0, 0, 0, 0,       0, 0, 0, 0, 0,      0,  0,      0,      0,
//5   0, 0, 0, 0, 0, 1,       0, 0, 0, 0, 1,      0,  0,      0,      0,      1,      0,      0,      0,      0,      0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
//7   0, 0, 0, 0, 0, 1,       0, 1, 0, 0, 1,      0,  1,      0,      1,      1,      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
