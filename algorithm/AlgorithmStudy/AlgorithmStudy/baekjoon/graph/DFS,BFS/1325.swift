//
//  1325.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/06/30.
//

func solution1325() {
    let nm: [Int] = readLine()!.split(separator: " ").map{ Int($0)!
    }
    let n = nm[0]
    let m = nm[1]

    var graph: [[Int]] = Array(repeating: [], count: n+1)
    for _ in 0..<m {
        let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
        graph[input[1]].append(input[0])
    }
    var answer: [Int] = Array(repeating: 0, count: n+1)
    for computerNumber in 1...n {
        var stack: [Int] = [computerNumber]
        var visited: [Bool] = Array(repeating: false, count: n+1)
        while !stack.isEmpty {
            let hack = stack.removeLast()
            if !visited[hack] {
                visited[hack] = true
                stack.append(contentsOf: graph[hack])
                answer[computerNumber] += 1
            }
        }
    }

    var output: [String] = []
    guard let max = answer.max() else { return }
    for i in 0...n {
        if max == answer[i] { output.append(String(i)) }
    }
    print(output.joined(separator: " "))
}

func dfs1325(_ graph: [Set<Int>], start: Int) -> Int {
    var stack: [Int] = [start]
    var visitedNode: [Int] = []

    while !stack.isEmpty {
        let node = stack.removeLast()
        if !visitedNode.contains(node) {
            visitedNode.append(node)
            graph[node].forEach {
                if !visitedNode.contains($0) { stack.append($0)}
            }
        }
    }

    return visitedNode.count
}

func bfs1325(_ graph: [Set<Int>], start: Int) -> Int {
    var visitedNode: Set<Int> = []

    func bfs(_ graph: [Set<Int>], node: Int) {
        if !visitedNode.contains(node) {
            visitedNode.insert(node)
            graph[node].forEach {
                if !visitedNode.contains($0) { bfs(graph, node: $0)}
            }
        }
    }

    bfs(graph, node: start)

    return visitedNode.count
}
