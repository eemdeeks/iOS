//
//  10451.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 12/22/23.
//

import Foundation

func solution10451() {
    let T: Int = Int(readLine()!)!

    for _ in 0..<T {
        let N: Int = Int(readLine()!)!
        var graph: [Int] = [0]
        var nodes: [Int] = [0]
        var answer: Int = 0
        let prob: [Int] = readLine()!.components(separatedBy: " ").map{ Int($0)!}
        graph += prob

        for i in 1...N {
            if !nodes.contains(i) {
                answer += 1
                search10451(graph, start: i, nodes: &nodes)
            }
        }
        print(answer)
    }
}

func search10451(_ graph: [Int], start: Int, nodes: inout [Int]) {
    var need: [Int] = [start]
    var visit: [Int] = []
    while !need.isEmpty {
        let node: Int = need.removeLast()
        if visit.contains(node) { continue }

        need.append(graph[node])
        visit.append(node)
    }
    nodes += visit
}
