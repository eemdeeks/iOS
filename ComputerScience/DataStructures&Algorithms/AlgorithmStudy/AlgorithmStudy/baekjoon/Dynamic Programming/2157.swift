//
//  2157.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/2/26.
//


func solution2157() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()
    let k = fileIO.readInt()

    var edges: [[(destination: Int, value: Int)]] = Array(repeating: [], count: n + 1)
    var graph: [[Int]] = Array(repeating: Array(repeating: -1, count: n + 1), count: n + 1)
    var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: n + 1), count: m + 1)

    var a: Int
    var b: Int
    var c: Int

    for _ in 0..<k {
        a = fileIO.readInt()
        b = fileIO.readInt()
        c = fileIO.readInt()

        if a > b { continue }

        graph[a][b] = max(graph[a][b], c)
    }

    for x in 1...n {
        for y in 1...n {
            if graph[x][y] != -1 {
                edges[x].append((y, graph[x][y]))
            }
        }
    }

    dp[1][1] = 0

    for i in 2...m {
        for j in 1...n {
            if dp[i - 1][j] == -1 { continue }
            for edge in edges[j] {
                dp[i][edge.destination] = max(dp[i][edge.destination], dp[i - 1][j] + edge.value)
            }
        }
    }

    var answer = -1

    for i in 1...m {
        answer = max(answer, dp[i][n])
    }

    print(answer)
}

