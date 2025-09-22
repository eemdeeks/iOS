//
//  2606.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/06/29.
//

import Foundation

func solution2606() {
    let n: Int = Int(readLine()!)!
    let numberOfLine: Int = Int(readLine()!)!
    
    var graph: [[Int]] = []
    for _ in 0...n {
        graph.append([])
    }
    for _ in 0..<numberOfLine {
        let line: [Int] = readLine()!.components(separatedBy: " ").map{ Int(String($0))!
            
        }
        graph[line[0]].append(line[1])
        graph[line[1]].append(line[0])
    }
    
    dfs2606(graph, start: 1)
    
}

func dfs2606(_ graph: [[Int]], start: Int) {
    var visitedNode: [Int] = [start]
    var answer: [Int] = []
    
    while !visitedNode.isEmpty {
        let node = visitedNode.removeLast()
        if !answer.contains(node){
            answer.append(node)
            visitedNode += graph[node]
        }
    }
    print(answer.count-1)
}
