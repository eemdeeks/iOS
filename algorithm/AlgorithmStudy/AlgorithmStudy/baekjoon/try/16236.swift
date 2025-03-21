//
//  16236.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/12/25.
//
import Foundation

func solution16236() {
    let n = Int(readLine()!)!
    var graph: [[Int]] = []
    var xPoint: Int = -1
    var yPoint: Int = -1
    var shark: Int = 2
    var eatingCount: Int = 0
    for x in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        if let index = input.firstIndex(of: 9) {
            yPoint = index
            xPoint = x
        }
        graph.append(input)
    }

    var sharkPosition = SharkPosition(x: xPoint, y: yPoint, time: 0)
    var queue = Queue<SharkPosition>()
    queue.append(sharkPosition)
    var visited: Set<[Int]> = []
    while !queue.isEmpty() {
        guard var newPosition = queue.popFirst() else { break }
        if graph[newPosition.x][newPosition.y] < shark && graph[newPosition.x][newPosition.y] != 0 {
            for position in queue.queue {
                if position < newPosition && graph[position.x][position.y] < shark && graph[position.x][position.y] != 0 {
                    newPosition = position
                }
            }
            queue = Queue<SharkPosition>()
            queue.append(newPosition)
            graph[sharkPosition.x][sharkPosition.y] = 0
            sharkPosition = newPosition
            graph[sharkPosition.x][sharkPosition.y] = 9
            visited = []
            eatingCount += 1
            if eatingCount == shark {
                eatingCount = 0
                shark += 1
            }
            continue
        } else {
            visited.insert([newPosition.x, newPosition.y])
        }
        if let top = newPosition.moveTop(shark: shark, graph: graph, visited: visited) {
            queue.append(top)
        }

        if let left = newPosition.moveLeft(shark: shark, graph: graph, visited: visited) {
            queue.append(left)
        }

        if let right = newPosition.moveRight(shark: shark, graph: graph, visited: visited) {
            queue.append(right)
        }

        if let bottom = newPosition.moveBottom(shark: shark, graph: graph, visited: visited) {
            queue.append(bottom)
        }
    }

    print(sharkPosition.time)
}

struct SharkPosition {
    let x: Int
    let y: Int
    let time: Int

    func moveTop(shark: Int, graph: [[Int]], visited: Set<[Int]>) -> SharkPosition? {
        guard
            x != 0,
            !visited.contains([x-1,y]),
            graph[x-1][y] <= shark
        else { return nil }

        return SharkPosition(x: x-1, y: y, time: time + 1)
    }

    func moveLeft(shark: Int, graph: [[Int]], visited: Set<[Int]>) -> SharkPosition? {
        guard
            y != 0,
            !visited.contains([x,y-1]),
            graph[x][y-1] <= shark
        else { return nil }

        return SharkPosition(x: x, y: y-1, time: time + 1)
    }

    func moveRight(shark: Int, graph: [[Int]], visited: Set<[Int]>) -> SharkPosition? {
        guard
            x != graph.count-1,
            !visited.contains([x+1,y]),
            graph[x+1][y] <= shark
        else { return nil }

        return SharkPosition(x: x+1, y: y, time: time + 1)
    }

    func moveBottom(shark: Int, graph: [[Int]], visited: Set<[Int]>) -> SharkPosition? {
        guard
            y != graph.count-1,
            !visited.contains([x,y+1]),
            graph[x][y+1] <= shark
        else { return nil }

        return SharkPosition(x: x, y: y+1, time: time + 1)
    }
}

extension SharkPosition: Comparable {
    static func < (lhs: SharkPosition, rhs: SharkPosition) -> Bool {
        if lhs.time == rhs.time {
            if lhs.x == rhs.x {
                return lhs.y < rhs.y
            } else {
                return lhs.x < rhs.x
            }
        } else {
            return lhs.time < rhs.time
        }
    }
}

struct Queue<T: Comparable> {
    var queue: [T] = []
    private var head: Int = 0

    func isEmpty() -> Bool {
        queue.count <= head
    }

    mutating func append(_ element: T) {
        queue.append(element)
    }

    mutating func popFirst() -> T? {
        if isEmpty() { return nil }
        head += 1
        return queue[head-1]
    }

    mutating func sort() {
        queue.sort()
    }
}
