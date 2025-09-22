//
//  1967.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/18/25.
//


func solution1967() {
    let fileIO = FileIO()

    let nodeCount = fileIO.readInt()

    var parent: Int
    var child: Int
    var value: Int
    var map: [[[Int]]] = Array(repeating: [], count: nodeCount + 1)
    var edgeCount = Array(repeating: 0, count: nodeCount + 1)
    for _ in 0..<nodeCount-1 {
        parent = fileIO.readInt()
        child = fileIO.readInt()
        value = fileIO.readInt()
        map[parent].append([child, value])
        map[child].append([parent, value])
        edgeCount[parent] += 1
        edgeCount[child] += 1
    }

    var answer = 0
    var stack: [Int]
    var maxValue: Int
    var visited: [Int]

    stack = [1]
    maxValue = 0
    var maxNode = 0
    visited = Array(repeating: 0, count: nodeCount + 1)
    visited[1] = 1
    while !stack.isEmpty {
        let node = stack.removeLast()

        for edge in map[node] {
            if visited[edge[0]] == 0 {
                stack.append(edge[0])
                let value = visited[node] + edge[1]
                visited[edge[0]] = value
                if maxValue < value {
                    maxValue = value
                    maxNode = edge[0]
                }
            }
        }
    }

    stack = [maxNode]
    visited = Array(repeating: 0, count: nodeCount + 1)
    visited[maxNode]
    while !stack.isEmpty {
        let node = stack.removeLast()

        for edge in map[node] {
            if visited[edge[0]] == 0 && edge[0] != maxNode {
                stack.append(edge[0])
                let value = visited[node] + edge[1]
                visited[edge[0]] = value
                answer = max(value, answer)
            }
        }
    }

    print(answer)
}
