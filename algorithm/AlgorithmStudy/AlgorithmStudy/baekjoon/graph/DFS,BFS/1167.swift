//
//  1167.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/19/25.
//

func solution1167() {
    let fileIO = FileIO()

    let v = fileIO.readInt()

    var tree: [[[Int]]] = Array(repeating: [], count: v + 1)

    for _ in 0..<v {
        let node = fileIO.readInt()
        while true {
            let end = fileIO.readInt()
            if end == -1 { break }
            let value = fileIO.readInt()
            tree[node].append([end, value])
        }
    }

    var stack: [Int] = [1]
    var visited: [Int] =  Array(repeating: -1, count: v + 1)
    visited[1] = 0
    var maxValue = 0
    var maxIndex = 0

    while !stack.isEmpty {
        let node = stack.removeLast()

        for edge in tree[node] {
            if visited[edge[0]] != -1 { continue }

            let newValue = visited[node] + edge[1]
            visited[edge[0]] = newValue
            stack.append(edge[0])
            if maxValue < newValue {
                maxValue = newValue
                maxIndex = edge[0]
            }
        }
    }

    stack = [maxIndex]
    visited = Array(repeating: -1, count: v + 1)
    visited[maxIndex] = 0
    maxValue = 0

    while !stack.isEmpty {
        let node = stack.removeLast()

        for edge in tree[node] {
            if visited[edge[0]] != -1 { continue }

            let newValue = visited[node] + edge[1]
            visited[edge[0]] = newValue
            stack.append(edge[0])
            maxValue = max(maxValue, newValue)
        }
    }

    print(maxValue)
}

