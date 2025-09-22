//
//  16236.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/12/25.
//
import Foundation

func solution16236() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var map: [[Int]] = []
    let moveX: [Int] = [-1, 0, 1, 0]
    let moveY: [Int] = [0, -1, 0, 1]
    var babySharkPosition: (x: Int, y: Int) = (0, 0)
    var babySharkSize = 2
    var eatingCount = 0
    var answer = 0
    var visited: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: n)

    for x in 0..<n {
        var fishes: [Int] = []
        for y in 0..<n {
            let fish = fileIO.readInt()
            if fish == 9 { babySharkPosition = (x, y) }
            fishes.append(fish)
        }
        map.append(fishes)
    }

    while true {
        visited = Array(repeating: Array(repeating: -1, count: n), count: n)
        var queue = Queue(elements: [babySharkPosition])
        visited[babySharkPosition.x][babySharkPosition.y] = 0
        var eatable: [(x: Int, y: Int)] = []

        while !queue.isEmpty {
            guard let position = queue.removeFirst() else { return }
            if let eatPosition = eatable.first {
                if visited[position.x][position.y] >= visited[eatPosition.x][eatPosition.y] { continue }
            }

            for i in 0..<4 {
                let newX = position.x + moveX[i]
                let newY = position.y + moveY[i]

                if newX < 0 || newX >= n || newY < 0 || newY >= n {
                    continue
                }

                if visited[newX][newY] != -1 {
                    continue
                }

                if map[newX][newY] == 0 {
                    queue.append((newX, newY))
                    visited[newX][newY] = visited[position.x][position.y] + 1
                    continue
                }

                if map[newX][newY] == babySharkSize {
                    queue.append((newX, newY))
                    visited[newX][newY] = visited[position.x][position.y] + 1
                    continue
                }

                if map[newX][newY] < babySharkSize {
                    visited[newX][newY] = visited[position.x][position.y] + 1
                    eatable.append((newX, newY))
                    continue
                }
            }
        }

        eatable.sort {
            if $0.x == $1.x {
                return $0.y < $1.y
            } else {
                return $0.x < $1.x
            }
        }

        guard let eatFishPosition = eatable.first else { break }
        answer += visited[eatFishPosition.x][eatFishPosition.y]
        map[eatFishPosition.x][eatFishPosition.y] = 9
        map[babySharkPosition.x][babySharkPosition.y] = 0
        babySharkPosition = eatFishPosition
        eatingCount += 1
        if babySharkSize == eatingCount {
            babySharkSize += 1
            eatingCount = 0
        }
    }

    print(answer)

    struct Queue {
        var elements: [(x: Int, y: Int)] = []
        var head: Int = 0
        var isEmpty: Bool { elements.count <= head }

        mutating func append(_ element: (x: Int, y: Int)) {
            elements.append(element)
        }

        mutating func removeFirst() -> (x: Int, y: Int)? {
            guard !isEmpty else { return nil }
            let value = elements[head]
            head += 1

            return value
        }
    }
}
