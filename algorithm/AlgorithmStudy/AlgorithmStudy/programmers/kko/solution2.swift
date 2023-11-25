//
//  solution2.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/25/23.
//

import Foundation
import Foundation

func solution2(_ edges:[[Int]]) -> [Int] {
    var maxNum: Int = 0
    for edge in edges {
        maxNum = max(maxNum, edge[0], edge[1])
    }

    var graph: [[Int]] = Array(repeating: [Int](), count: maxNum + 1)
    var findNode: [[Int]] = Array(repeating: [Int](), count: maxNum + 1)

    var answerNode = 0
    for edge in edges {
        graph[edge[0]].append(edge[1])
        findNode[edge[1]].append(edge[0])
    }

    for i in 1..<graph.count {
        if graph[i].count > 1 && findNode[i].count == 0 {
            answerNode = i
            break
        }
    }
//    var newEges: [[Int]] = []
    var newGraph: [[Int]] = Array(repeating: [Int](), count: maxNum + 1)

    for edge in edges {
        if edge[0] != answerNode {
            newGraph[edge[0]].append(edge[1])
            newGraph[edge[1]].append(edge[0])
        }
    }
    var nodes: [Bool] = []
    for _ in 0...maxNum {
        nodes.append(false)
    }

    var donut = 0
    var stick = 0
    var eight = 0
    var visited: [Int] = []

    for i in 1...maxNum where i != answerNode {
        if graph[i].isEmpty {
            stick += 1
            visited += dfsForKko(graph: newGraph, start: i)
        }else if graph[i].count == 2 {
            eight += 1
            visited += dfsForKko(graph: graph, start: i)
        }
    }
    for i in visited {
        nodes[i] = true
    }
    nodes[0] = true
    nodes[answerNode] = true
    // while nodes.contains(false) {
        for i in 0...maxNum where !nodes[i] {
            var new = dfsForKko(graph: graph, start: i)
            for node in new {
                nodes[node] = true
            }
            donut += 1

        }
    // }
    return [answerNode,donut,stick,eight]
}

func dfsForKko(graph: [[Int]], start: Int) -> [Int] {
    var visitedQueue: [Int] = []
    var needVisitStack: Set = [start]

    while !needVisitStack.isEmpty {
        let node: Int = needVisitStack.removeFirst()
        if visitedQueue.contains(node) { continue }

        visitedQueue.append(node)
        for i in graph[node] {
            needVisitStack.insert(i)
        }
    }
    return visitedQueue
}
