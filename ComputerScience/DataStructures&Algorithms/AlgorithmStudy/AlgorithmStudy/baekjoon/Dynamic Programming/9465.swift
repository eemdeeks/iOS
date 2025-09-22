//
//  File.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/29/25.
//

// 다이나믹 프로그래밍
func solution9465() {
    let fileIO = FileIO()

    let testCase = fileIO.readInt()

    for _ in 0..<testCase {
        let n = fileIO.readInt()

        var graph: [[Int]] = []
        for _ in 0..<2 {
            var line: [Int] = []
            for _ in 0..<n {
                line.append(fileIO.readInt())
            }
            graph.append(line)
        }
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: 2)
        for i in 0...1 {
            dp[i][0] = graph[i][0]
        }

        for i in 1..<n {
            for j in 0...1 {
                dp[j][i] = max(dp[(j - 1) * -1][i - 1] + graph[j][i], dp[j][i - 1])
            }
        }

        print(max(dp[0][n - 1], dp[1][n - 1]))
    }
}
