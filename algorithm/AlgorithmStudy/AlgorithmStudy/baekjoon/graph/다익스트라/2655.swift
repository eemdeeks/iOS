//
//  Deque.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 8/25/25.
//

// 0-1 BFS, 다익스트라
func solution2655() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var map: [[String]] = []

    for _ in 0..<n { map.append(fileIO.readString().map { String($0) }) }

    var visited: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: n)
    visited[0][0] = 0
    var queue = Deque<(Int, Int)>(frontElement: [(0, 0)])

    let moveX = [-1, 0, 1, 0]
    let moveY = [0, 1, 0, -1]

    while !queue.isEmpty {
        guard let element = queue.removeFirst() else { break }

        for i in 0..<4 {
            let nextX = element.0 + moveX[i]
            let nextY = element.1 + moveY[i]
            
            if nextX < 0 || nextX >= n || nextY < 0 || nextY >= n { continue }
            
            if visited[nextX][nextY] != -1 { continue }

            switch map[nextX][nextY] {
            case "1":
                visited[nextX][nextY] = visited[element.0][element.1]
                queue.insertFirst((nextX, nextY))
            case "0":
                visited[nextX][nextY] = visited[element.0][element.1] + 1
                queue.append((nextX, nextY))
            default:
                break
            }
        }
    }

    print(visited[n - 1][n - 1])

    struct Deque<T> {
        var frontElement: [T] = []
        var rearElement: [T] = []
        var isEmpty: Bool { frontElement.isEmpty && rearElement.isEmpty }

        mutating func append(_ element: T) { rearElement.append(element) }

        mutating func insertFirst(_ element: T) { frontElement.append(element) }

        mutating func removeFirst() -> T? {
            if isEmpty { return nil }
            if frontElement.isEmpty {
                frontElement = rearElement.reversed()
                rearElement = []
            }
            return frontElement.removeLast()
        }
    }

}
