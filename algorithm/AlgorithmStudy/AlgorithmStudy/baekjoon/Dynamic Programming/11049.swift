//
//  11049.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/22/25.
//

// MARK: - 연쇄행렬최소곱셈
func solution11049() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var d: [Int] = []
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var r: Int
    var c: Int

    for i in 0..<n {
        r = fileIO.readInt()
        c = fileIO.readInt()
        d.append(r)
        if i == n - 1 { d.append(c)}
    }
    var x: Int
    var y: Int
    var value: Int
    for i in 0..<n {
        for j in 0..<n - i {
            x = j
            y = j + i
            if x == y { continue }

            for k in x..<y {
                value = dp[x][k] + dp[k + 1][y] + d[x] * d[k+1] * d[y+1]
                dp[x][y] = dp[x][y] == 0 ? value: min(dp[x][y], value)
            }
        }
    }

    print(dp[0][n-1])
}
