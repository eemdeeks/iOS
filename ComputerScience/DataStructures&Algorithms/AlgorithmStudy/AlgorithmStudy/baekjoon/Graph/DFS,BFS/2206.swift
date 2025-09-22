//
//  2206.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/17/25.
//

func solution2206() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let xMax = input[0]
    let yMax = input[1]

    var map: [[Int]] = []
    var visited: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: -1, count: yMax), count: xMax), count: 2)

    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]

    for _ in 0..<xMax {
        map.append(readLine()!.map { Int(String($0))! })
    }

    var queue = Queue(elements: [[0,0,0]])
    visited[0][0][0] = 1

    while !queue.isEmpty {
        guard let position = queue.removeFirst() else { break }

        for i in 0..<4 {
            let newX = position[0] + moveX[i]
            let newY = position[1] + moveY[i]
            var newKey = position[2]

            if newX < 0 || newY < 0 || newX >= xMax || newY >= yMax {
                continue
            }

            if map[newX][newY] == 0 && visited[newKey][newX][newY] == -1 {
                visited[newKey][newX][newY] = visited[position[2]][position[0]][position[1]] + 1
                queue.append([newX, newY, newKey])
            } else if map[newX][newY] == 1 && newKey == 0 && visited[newKey][newX][newY] == -1 {
                newKey = 1
                visited[newKey][newX][newY] = visited[position[2]][position[0]][position[1]] + 1
                queue.append([newX, newY, newKey])
            }
        }
    }

    let answerWithout = visited[0][xMax-1][yMax-1]
    let answerWith = visited[1][xMax-1][yMax-1]

    if answerWithout == -1 {
        print(answerWith)
    } else if answerWith == -1 {
        print(answerWithout)
    } else {
        print(min(answerWith,answerWithout))
    }

    struct Queue {
        var elements: [[Int]]
        var head: Int = 0
        var isEmpty: Bool { elements.count <= head }

        mutating func append(_ element: [Int]) {
            elements.append(element)
        }

        mutating func removeFirst() -> [Int]? {
            guard !isEmpty else { return nil }
            head += 1

            return elements[head - 1]
        }
    }
}
