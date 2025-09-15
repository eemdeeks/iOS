//
//  1613.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 9/15/25.
//

// 플로이드 워셜
// 사건의 전후 관계를 알기 위해 위상정렬이 아닌 플로이드워셜 이용 예제
func solution1613() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let k = fileIO.readInt()

    var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: n + 1), count: n + 1)

    for _ in 0..<k {
        let start = fileIO.readInt()
        let end = fileIO.readInt()

        dp[start][end] = 1
    }

    for x in 1...n {
        for compareX in 1...n where x != compareX {
            if dp[compareX][x] == -1 { continue }
            for y in 1...n {
                if dp[x][y] == -1 { continue }
                let newValue = dp[x][y] + dp[compareX][x]
                dp[compareX][y] = dp[compareX][y] == -1 ? newValue: min(dp[compareX][y], newValue)
            }
        }
    }

    var answer: [String] = []
    
    for _ in 0..<fileIO.readInt() {
        let start = fileIO.readInt()
        let end = fileIO.readInt()

        if dp[start][end] == -1 {
            answer.append(dp[end][start] == -1 ? "0": "1")
        } else {
            answer.append("-1")
        }
    }

    print(answer.joined(separator: "\n"))
}

