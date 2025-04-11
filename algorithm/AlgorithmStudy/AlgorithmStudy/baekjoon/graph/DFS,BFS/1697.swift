//
//  1697.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/10/25.
//

func solution1697() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = input[0]
    let end = input[1]

    var visited: [Int] = Array(repeating: -1, count: 100001)

    var queue = Queue(elements: [start])
    visited[start] = 0

    while !queue.isEmpty {
        guard let position = queue.removeFirst() else { break }

        if position == end {
            break
        }
        move(position: position, newPosition: position + 1)
        move(position: position, newPosition: position - 1)
        move(position: position, newPosition: position * 2)
    }

    print(visited[end])

    func move(position: Int, newPosition: Int) {
        if newPosition < 0 || newPosition > 100000 {
            return
        }

        if visited[newPosition] != -1 {
            return
        }

        visited[newPosition] = visited[position] + 1
        queue.append(newPosition)
    }

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
