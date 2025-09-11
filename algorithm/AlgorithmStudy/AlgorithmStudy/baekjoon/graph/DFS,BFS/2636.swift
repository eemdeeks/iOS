//
//  2636.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 9/11/25.
//


func solution2636() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var graph: [[Int]] = []

    for _ in 0..<n {
        var element: [Int] = []
        for _ in 0..<m {
            element.append(fileIO.readInt())
        }
        graph.append(element)
    }

    let visitedMock = Array(repeating: Array(repeating: false, count: m), count: n)
    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]
    var answer: [Int] = []

    while true {
        var queue = Queue<(x: Int, y: Int)>()
        var visited = visitedMock
        var meltings: [(x: Int, y: Int)] = []
        queue.append((0, 0))

        while !queue.isEmpty {
            guard let element = queue.removeFirst() else { break }

            visited[element.x][element.y] = true

            for i in 0..<4 {
                let newX = element.x + moveX[i]
                let newY = element.y + moveY[i]

                if newX < 0 || newX >= n || newY < 0 || newY >= m {
                    continue
                }

                if visited[newX][newY] {
                     continue
                }

                visited[newX][newY] = true
                if graph[newX][newY] == 1 {
                    meltings.append((newX, newY))
                    continue
                }

                queue.append((newX, newY))

            }
        }

        if meltings.count == 0 { break }

        for cheese in meltings {
            graph[cheese.x][cheese.y] = 0
        }

        answer.append(meltings.count)
    }

    print(answer.count)
    print(answer.last ?? 0)

    struct Queue<T> {
        var frontElements: [T] = []
        var backElements: [T] = []
        var isEmpty: Bool { frontElements.isEmpty && backElements.isEmpty }

        mutating func append(_ element: T) {
            backElements.append(element)
        }

        mutating func removeFirst() -> T? {
            if isEmpty { return nil }
            if frontElements.isEmpty {
                frontElements = backElements.reversed()
                backElements = []
            }

            return frontElements.popLast()
        }
    }
}
