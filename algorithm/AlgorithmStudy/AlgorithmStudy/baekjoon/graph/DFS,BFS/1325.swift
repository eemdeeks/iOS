//
//  1325.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/06/30.
//

import Foundation

func solution1325() {
    let nm: [Int] = readLine()!.components(separatedBy: " ").map{ Int(String($0))!
    }
    var graph: [[Int]] = Array(repeating: [Int](), count: nm[0]+1)
    
    for _ in 0..<nm[1] {
        let nodes = readLine()!.components(separatedBy: " ").map{ Int(String($0))!
        }
        graph[nodes[1]].append(nodes[0])
    }
    var answer: [Int] = Array(repeating: 0, count: nm[0])
    for i in 0..<nm[0] {
        answer[i] = dfs1325(graph, start: i+1)
    }
    for i in 0..<nm[0] {
        if answer[i] >= answer.max()!{
            print(i+1, terminator: " ")
        }
    }
}
func dfs1325(_ graph: [[Int]], start: Int) -> Int {
    var stack: [Int] = [start]
    var visitedNode:[Int] = []
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        if !visitedNode.contains(node){
            visitedNode.append(node)
            stack += graph[node]
        }
    }
    return visitedNode.count
}
