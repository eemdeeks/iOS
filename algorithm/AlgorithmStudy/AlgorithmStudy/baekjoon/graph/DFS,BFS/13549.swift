//
//  13549.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/15/25.
//

func solution13549() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = input[0]
    let end = input[1]

    var queue = Queue(frontElements: [start], backElements: [])
    var visited = Array(repeating: -1, count: 200000)
    visited[start] = 0
    while !queue.isEmpty {
        guard let position = queue.removeFirst() else { break }
        if visited[end] != -1 {
            print(visited[end])
            return
        }

        teleport(position: position, newPosition: position * 2)
        move(position: position, newPosition: position - 1)
        move(position: position, newPosition: position + 1)
    }

    func teleport(position: Int, newPosition: Int) {
        guard newPosition < 200000 else { return }
        if visited[newPosition] == -1 {
            queue.insertFirst(newPosition)
            visited[newPosition] = visited[position]
        }
    }

    func move(position: Int, newPosition: Int) {
        guard
            newPosition >= 0,
            newPosition < 200000,
            visited[newPosition] == -1
        else { return }

        queue.append(newPosition)
        visited[newPosition] = visited[position] + 1
    }

    struct Queue {
        var frontElements: [Int]
        var backElements: [Int]
        var frontHead: Int = 0
        var backHead: Int = 0
        var frontIsEmpty: Bool { frontElements.count <= frontHead }
        var backIsEmpty: Bool { backElements.count <= backHead }
        var isEmpty: Bool { frontIsEmpty && backIsEmpty }

        mutating func append(_ element: Int) {
            backElements.append(element)
        }

        mutating func insertFirst(_ element: Int) {
            frontElements.append(element)
        }

        mutating func removeFirst() -> Int? {
            guard !isEmpty else { return nil }
            if frontIsEmpty {
                backHead += 1
                return backElements[backHead - 1]
            }
            return frontElements.removeLast()
        }
    }
}
