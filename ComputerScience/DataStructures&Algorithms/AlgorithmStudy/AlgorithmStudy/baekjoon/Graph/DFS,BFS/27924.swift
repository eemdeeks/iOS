//
//  Queue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 8/18/25.
//

func solution27924() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var leafs: [Int] = []
    for _ in 0..<n-1 {
        let a = fileIO.readInt()
        let b = fileIO.readInt()

        graph[a].append(b)
        graph[b].append(a)
    }

    for node in 0...n {
        if graph[node].count == 1 { leafs.append(node) }
    }

    let a = fileIO.readInt()
    let b = fileIO.readInt()
    let c = fileIO.readInt()

    let starts: [Int] = [a, b, c]
    var visited: [[Int]] = Array(repeating: Array(repeating: 200001, count: n + 1), count: 3)
    var queues: [Queue] = [
        Queue(elements: [a], head: 0),
        Queue(elements: [b], head: 0),
        Queue(elements: [c], head: 0)
    ]

    for i in 0..<3 {
        visited[i][starts[i]] = 0
        while !queues[i].isEmpty {
            if let currentNode = queues[i].dequeue() {
                for nextNode in graph[currentNode] {
                    if visited[i][nextNode] > visited[i][currentNode] + 1 {
                        visited[i][nextNode] = visited[i][currentNode] + 1
                        queues[i].enqueue(nextNode)
                    }
                }
            }
        }
    }

    var answer: Bool = false
    for leaf in leafs {
        if visited[0][leaf] < visited[1][leaf] && visited[0][leaf] < visited[2][leaf] {
            answer = true
        }
    }

    print(answer ? "YES": "NO")

    struct Queue {
        var elements: [Int] = []
        var head: Int
        var isEmpty: Bool { elements.count <= head }

        mutating func enqueue(_ element: Int) {
            elements.append(element)
        }
        
        mutating func dequeue() -> Int? {
            if isEmpty { return nil }
            defer { head += 1 }
            return elements[head]
        }
    }
}
