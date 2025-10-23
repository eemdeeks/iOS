//
//  Queue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 10/22/25.
//


func solution3055() {
    let fileIO = FileIO()

    let r = fileIO.readInt()
    let c = fileIO.readInt()

    var map: [[String]] = []
    for _ in 0..<r {
        map.append(fileIO.readString().map { String($0) })
    }

    typealias Position = (x: Int, y: Int)
    typealias Positions = [Position]
    var destination: Position = (0, 0)
    var start: Position = (0, 0)
    var water: Positions = []
    for x in 0..<r {
        for y in 0..<c {
            switch map[x][y] {
            case "D":
                destination = (x, y)
            case "S":
                start = (x, y)
            case "*":
                water.append((x, y))
            default:
                continue
            }
        }
    }

    var visitedWater: [[Int]] = Array(repeating: Array(repeating: -1, count: c), count: r)
    var visitedCastor: [[Int]] = Array(repeating: Array(repeating: -1, count: c), count: r)

    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]

    var queue = Queue<Position>()
    for waterPosition in water {
        queue.append(waterPosition)
        visitedWater[waterPosition.x][waterPosition.y] = 0
    }

    while !queue.isEmpty {
        guard let position = queue.removeFirst() else { continue }

        for i in 0..<4 {
            let newX = position.x + moveX[i]
            let newY = position.y + moveY[i]

            if newX < 0 || newX >= r || newY < 0 || newY >= c {
                continue
            }

            if map[newX][newY] == "X" || map[newX][newY] == "D" || visitedWater[newX][newY] != -1 {
                continue
            }

            visitedWater[newX][newY] = visitedWater[position.x][position.y] + 1
            queue.append((newX, newY))
        }
    }

    queue = Queue<Position>()
    queue.append(start)
    visitedCastor[start.x][start.y] = 0

    while !queue.isEmpty {
        guard let position = queue.removeFirst() else { continue }
        let time = visitedCastor[position.x][position.y]

        for i in 0..<4 {
            let newX = position.x + moveX[i]
            let newY = position.y + moveY[i]

            if newX < 0 || newX >= r || newY < 0 || newY >= c {
                continue
            }

            if map[newX][newY] == "X" || visitedCastor[newX][newY] != -1 {
                continue
            }

            if visitedWater[newX][newY] != -1 && visitedWater[newX][newY] <= time + 1 {
                continue
            }

            visitedCastor[newX][newY] = visitedCastor[position.x][position.y] + 1
            queue.append((newX, newY))
        }
    }

    let answer = visitedCastor[destination.x][destination.y]
    print(answer == -1 ? "KAKTUS": answer)

    struct Queue<T> {
        var leftElements: [T] = []
        var rightElements: [T] = []

        var isEmpty: Bool { leftElements.isEmpty && rightElements.isEmpty }

        mutating func append(_ element: T) {
            rightElements.append(element)
        }

        mutating func removeFirst() -> T? {
            if isEmpty { return nil }
            if leftElements.isEmpty {
                leftElements = rightElements.reversed()
                rightElements.removeAll()
            }

            return leftElements.popLast()
        }
    }

}
