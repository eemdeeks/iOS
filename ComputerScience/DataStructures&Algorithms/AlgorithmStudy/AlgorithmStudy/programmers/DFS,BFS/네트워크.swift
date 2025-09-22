//
//  네트워크.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/1/24.
//

import Foundation

/*
 3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]] -> 2
 3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]] -> 1
 */
func network(_ n:Int, _ computers:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: [], count: n)
    var check: Set<Int> = []
    var answer: Int = 0

    for i in 0..<n {
        check.insert(i)
        for j in 0..<n {
            if i == j { continue }
            if computers[i][j] == 1 { graph[i].append(j)}
        }
    }

    while !check.isEmpty {
        if let first = check.first {
            for visit in dfs(graph, first) {
                check.remove(visit)
            }
        }
        answer += 1
    }

    func dfs(_ graph: [[Int]], _ first: Int) -> Set<Int> {
        var visited: Set<Int> = []
        var needVisit: [Int] = [first]

        while !needVisit.isEmpty {
            let node: Int = needVisit.removeLast()

            if visited.contains(node) {
                continue
            } else {
                needVisit += graph[node]
                visited.insert(node)
            }
        }

        return visited
    }

    return answer
}
