//
//  1149.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/29/25.
//

// 다이나믹 프로그래밍
func solution1149() {
    let fileIO = FileIO()

    var graph: [[Int]] = []
    var dp: [[Int]] = []

    let n = fileIO.readInt()

    for _ in 0..<n {
        graph.append([fileIO.readInt(), fileIO.readInt(), fileIO.readInt()])
        dp.append([0, 0, 0])
    }

    dp[0] = graph[0]

    for i in 1..<n {
        for j in 0..<3 {
            var minValue: Int = 1000001
            for k in 0..<3 {
                if j == k { continue }
                minValue = min(dp[i - 1][k], minValue)
            }
            dp[i][j] = minValue + graph[i][j]
        }
    }

    print(dp[n - 1].min()!)
}
