//
//  7576.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/9/25.
//

func solution7576() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let yCount = input[0]
    let xCount = input[1]
    let xMove = [-1, 0, 1, 0]
    let yMove = [0, -1, 0, 1]
    var tomatoes: [[Int]] = []
    var answer: Int = -1

    for _ in 0..<xCount {
        tomatoes.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    var beChanges = Queue(queue: [])
    var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: yCount), count: xCount)
    for x in 0..<xCount {
        for y in 0..<yCount {
            if tomatoes[x][y] == 1 {
                beChanges.append([x, y])
            }
        }
    }

    while !beChanges.isEmpty {
        guard let change = beChanges.removeFirst() else { break }

        for i in 0..<4 {
            let newX = change[0] + xMove[i]
            let newY = change[1] + yMove[i]

            if newX < 0 || newY < 0 || newX >= xCount || newY >= yCount {
                continue
            }

            if visited[newX][newY] > 0 || tomatoes[newX][newY] == 1 || tomatoes[newX][newY] == -1 {
                continue
            }

            beChanges.append([newX, newY])
            visited[newX][newY] = visited[change[0]][change[1]] + 1
            tomatoes[newX][newY] = 1
        }

    }

    for tomato in tomatoes {
        if tomato.contains(0) {
            print(-1)
            return
        }
    }

    for visite in visited {
        guard let max = visite.max() else { continue }
        if answer < max {
            answer = max
        }
    }

    print(answer)

    struct Queue {
        var queue: [[Int]]
        var point: Int = 0
        var isEmpty: Bool { queue.count <= point }

        mutating func append(_ element: [Int]) {
            queue.append(element)
        }

        mutating func removeFirst() -> [Int]? {
            guard !isEmpty else { return nil }
            point += 1

            return queue[point - 1]
        }
    }
}
