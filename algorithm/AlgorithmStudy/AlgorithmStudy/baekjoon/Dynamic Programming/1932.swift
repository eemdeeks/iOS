//
//  1932.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/29/25.
//


func solution1932() {
    let n: Int = Int(readLine()!)!
    var graph: [[Int]] = []

    var visited: [[Int]] = []

    for i in 1...n {
        graph.append(readLine()!.split(separator: " ").map { Int($0)! })
        visited.append(Array(repeating: -1, count: i))
    }

    visited[0][0] = graph[0][0]

    for i in 0..<n - 1 {
        for j in 0...i {
            for k in 0...1 {
                visited[i + 1][j + k] = max(visited[i][j] + graph[i + 1][j + k], visited[i + 1][j + k])
            }
        }
    }
    print(visited[n - 1].max()!)
}
