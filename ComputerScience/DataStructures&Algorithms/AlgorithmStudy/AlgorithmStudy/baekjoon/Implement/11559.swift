//
//  Queue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 9/24/25.
//

func solution11559() {
    let fileIO = FileIO()

    var graph: [[String]] = []
    let maxX = 12
    let maxY = 6
    for _ in 0..<maxX {
        let elements: [String] = fileIO.readString().map { String($0) }
        graph.append(elements)
    }

    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]
    var answer = -1

    var flag = true
    while flag {
        var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: maxY), count: maxX)
        flag = false
        answer += 1
        for x in 0..<maxX {
            for y in 0..<maxY {
                if visited[x][y] != 0 || graph[x][y] == "." {
                    continue
                }

                var queue = Queue<(x: Int, y: Int)>()

                queue.append((x, y))
                visited[x][y] = 1

                var sameIndex: [(x: Int, y: Int)] = []
                var maxCount: Int = 1

                while !queue.isEmpty {
                    guard let element = queue.removeFirst() else { break }
                    sameIndex.append(element)

                    for i in 0..<4 {
                        let newX = element.x + moveX[i]
                        let newY = element.y + moveY[i]

                        if newX < 0 || newX >= maxX || newY < 0 || newY >= maxY { continue }

                        if visited[newX][newY] != 0 { continue }

                        if graph[element.x][element.y] != graph[newX][newY] { continue }

                        maxCount += 1

                        visited[newX][newY] = maxCount

                        queue.append((newX, newY))
                    }
                }
                if maxCount >= 4 {
                    flag = true
                    for index in sameIndex {
                        graph[index.x][index.y] = "."
                    }
                }
            }
        }

        for y in 0..<maxY {
            var elements: [String] = []
            for x in 0..<maxX {
                if graph[x][y] == "." { continue }
                elements.append(graph[x][y])
            }

            var elementIndex = elements.count - 1
            for x in (0..<maxX).reversed() {
                if elementIndex >= 0 {
                    graph[x][y] = elements[elementIndex]
                    elementIndex -= 1
                } else {
                    graph[x][y] = "."
                }
            }
        }
    }

    print(answer)
    struct Queue<T> {
        var fronts: [T] = []
        var backs: [T] = []
        var isEmpty: Bool { fronts.isEmpty && backs.isEmpty }

        mutating func append(_ element: T) {
            backs.append(element)
        }

        mutating func removeFirst() -> T? {
            if isEmpty { return nil }
            if fronts.isEmpty {
                fronts = backs.reversed()
                backs = []
            }

            return fronts.popLast()
        }
    }
}
