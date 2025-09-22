//
//  14940.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/10/25.
//

func solution14940() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let xCount = input[0]
    let yCount = input[1]
    var map: [[Int]] = []
    var destinationX = 0
    var destinationY = 0
    var visitCount: [[Int]] = Array(repeating: Array(repeating: -1, count: yCount), count: xCount)
    let xMove = [-1, 0, 1, 0]
    let yMove = [0, -1, 0, 1]

    for x in 0..<xCount {
        let elements = readLine()!.split(separator: " ").map { Int($0)! }
        map.append(elements)
        guard let y = elements.firstIndex(of: 2) else {
            continue
        }
        destinationX = x
        destinationY = y
    }

    var queue = Queue(elements: [[destinationX, destinationY]])
    visitCount[destinationX][destinationY] = 0

    while !queue.isEmpty {
        guard let position = queue.removeFirst() else { break }

        for i in 0..<4 {
            let newX = position[0] + xMove[i]
            let newY = position[1] + yMove[i]

            if newX < 0 || newY < 0 || newX >= xCount || newY >= yCount {
                continue
            }

            if visitCount[newX][newY] != -1 || map[newX][newY] == 0 {
                continue
            }

            visitCount[newX][newY] = visitCount[position[0]][position[1]] + 1

            queue.append([newX, newY])
        }
    }

    for x in 0..<xCount {
        for y in 0..<yCount {
            if map[x][y] == 0 {
                visitCount[x][y] = 0
            }
        }
    }

    let answer = visitCount.map { $0.map { String($0) } }

    for i in answer {
        print(i.joined(separator: " "))
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
            let element = elements[head]
            head += 1

            return element
        }
    }
}
