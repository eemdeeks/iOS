//
//  전력망을 둘로 나누기.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/30/24.
//

import Foundation

/*
 9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]] -> 3
 4, [[1,2],[2,3],[3,4]] -> 0
 7, [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]]
 */
func electric(_ n:Int, _ wires:[[Int]]) -> Int {
    var solution: [Int] = []

    func makeTree(_ edges: [[Int]]) -> [[Int]] {
        var tree: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            tree[edge[0]-1].append(edge[1]-1)
            tree[edge[1]-1].append(edge[0]-1)
        }
        return tree
    }

    func dfs(_ tree: [[Int]]) -> Int {
        var visited: Set<Int> = []
        var need: [Int] = [0]

        while !need.isEmpty {
            var node = need.removeLast()
            if visited.contains(node) {
                continue
            } else {
                need += tree[node]
                visited.insert(node)
            }
        }
        return visited.count
    }

    for i in 0..<wires.count {
        var edges: [[Int]] = wires
        edges.remove(at: i)
        solution.append(dfs(makeTree(edges)))
    }

    if let answer = solution.map({ abs(n - $0 - $0) }).min() {
        return answer
    }
    return -1
}
