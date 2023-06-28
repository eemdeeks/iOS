//
//  1260.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/06/28.
//

import Foundation

func solution1260() {
    let NMV: [Int] = readLine()!.components(separatedBy: " ").map{
        Int(String($0))!
    }
    var graph: [[Int]] = []
    for _ in 0...NMV[0]{
        graph.append([])
    }
    for _ in 0..<NMV[1]{
        let node = readLine()!.components(separatedBy: " ").map{
            Int(String($0))!
        }
        graph[node[0]].append(node[1])
        graph[node[1]].append(node[0])
    }
    dfs1260(graph, start: NMV[2])
    bfs1260(graph, start: NMV[2])

}

func dfs1260(_ graph: [[Int]], start: Int) {
    var answer: [Int] = []
    var visitedNode: [Int] = [start]
    while !visitedNode.isEmpty {
        let node = visitedNode.removeLast()
        if !answer.contains(node) {
            answer.append(node)
            visitedNode += graph[node].sorted(by: >)
        }
    }
    print(answer.map({String($0)}).joined(separator: " "))
}

func bfs1260(_ graph: [[Int]], start: Int) {
    var answer: [Int] = []
    var visitedNode: [Int] = [start]
    
    while !visitedNode.isEmpty {
        let node = visitedNode.removeFirst()
        if !answer.contains(node){
            answer.append(node)
            visitedNode += graph[node].sorted()
        }
    }
    print(answer.map({String($0)}).joined(separator: " "))
}
