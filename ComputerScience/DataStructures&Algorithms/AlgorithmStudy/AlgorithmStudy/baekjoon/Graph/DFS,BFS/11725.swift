//
//  11725.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/11/25.
//


func solution11725() {
    let fileIO = FileIO()
    let n = fileIO.readInt()

    var tree: [[Int]] = Array(repeating: [], count: n + 1)

    for _ in 1..<n {
        let node1 = fileIO.readInt()
        let node2 = fileIO.readInt()

        tree[node1].append(node2)
        tree[node2].append(node1)
    }

    var visited: [Int] = Array(repeating: -1, count: n + 1)
    var queue = Queue(elements: [1])
    visited[1] = 0
    var answer: [String] = Array(repeating: "", count: n - 1)

    while !queue.isEmpty {
        guard let parent = queue.removeFirst() else { break }

        for child in tree[parent] {
            if visited[child] != -1 {
                continue
            }
            visited[child] = parent
            answer[child-2] = String(parent)
            queue.append(child)
        }
    }

    print(answer.joined(separator: "\n"))

    struct Queue {
        var elements: [Int]
        var head = 0
        var isEmpty: Bool { elements.count <= head }

        mutating func append(_ element: Int) {
            elements.append(element)
        }

        mutating func removeFirst() -> Int? {
            guard !isEmpty else { return nil }
            head += 1
            return elements[head - 1]
        }
    }
}
