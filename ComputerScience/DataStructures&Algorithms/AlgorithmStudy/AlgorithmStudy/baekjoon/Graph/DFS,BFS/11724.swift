//
//  11724.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 12/21/23.
//

import Foundation

func solution11724() {
    let NM: [Int] = readLine()!.components(separatedBy: " ").map {
        Int($0)!
    }
    var graph: [[Int]] = Array(repeating: [], count: NM[0]+1)
    var nodes: [Int] = [0]
    var answer: Int = 0

    if NM[1] != 0 {
        for _ in 1...NM[1] {
            let uv: [Int] = readLine()!.components(separatedBy: " ").map {
                Int($0)!
            }
            graph[uv[0]].append(uv[1])
            graph[uv[1]].append(uv[0])
        }
    }

    for i in 1...NM[0] {
        if !nodes.contains(i) {
            answer += 1
            dfs11724(graph, start: i, nodes: &nodes)
        }
    }
    print(answer)
}

func dfs11724(_ graph: [[Int]], start: Int, nodes: inout [Int]) {
    var need: [Int] = [start]
    var visit: [Int] = []

    while !need.isEmpty {
        let node: Int = need.removeLast()
        if visit.contains(node) { continue }

        need += graph[node]
        visit.append(node)
    }
    nodes += visit
}
