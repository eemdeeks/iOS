//
//  1865.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/29/25.
//

// 벨반-포드, 그래프 이론, 최단 경로
func solution1865() {
    let fileIO = FileIO()

    let testCase = fileIO.readInt()
    var answer: [String] = []
    for _ in 0..<testCase {
        let n = fileIO.readInt()
        let m = fileIO.readInt()
        let w = fileIO.readInt()

        var edges: [[Int]] = []
        var s: Int
        var e: Int
        var t: Int

        for _ in 0..<m {
            s = fileIO.readInt()
            e = fileIO.readInt()
            t = fileIO.readInt()

            edges.append([s, e, t])
            edges.append([e, s, t])
        }

        for _ in 0..<w {
            s = fileIO.readInt()
            e = fileIO.readInt()
            t = fileIO.readInt()

            edges.append([s, e, -t])
        }

        var distance = Array(repeating: 25000001, count: n + 1)

        distance[1] = 0

        var flag = false
        for i in 1...n {
            for edge in edges {
                if distance[edge[0]] + edge[2] < distance[edge[1]] {
                    distance[edge[1]] = distance[edge[0]] + edge[2]
                    if i == n {
                        flag = true
                    }
                }
            }
        }

        answer.append(flag ? "YES": "NO")
    }

    print(answer.joined(separator: "\n"))
}
