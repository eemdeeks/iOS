//
//  1194.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/12/25.
//

func solution1194() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let xCount = input[0]
    let yCount = input[1]
    let moveX = [-1, 0, 0, 1]
    let moveY = [0, -1, 1, 0]

    var zeroXPosition = 0
    var zeroYPosition = 0

    var map: [[String]] = []
    let visited: [[Bool]] = Array(repeating: Array(repeating: false, count: yCount), count: xCount)

    for i in 0..<xCount {
        let line = readLine()!.map{ String($0) }
        map.append(line)
        if line.contains("0") {
            zeroXPosition = i
            zeroYPosition = line.firstIndex(of: "0")!
        }
    }

    var queue = Queue1194(elements: [Minsick(position: (zeroXPosition, zeroYPosition), move: 0, key: [], visited: visited)])

    while !queue.isEmpty {
        var minsick = queue.removeFirst()!
        minsick.visited[minsick.position.0][minsick.position.1] = true
        for i in 0..<4 {
            let newXPosition = minsick.position.0 + moveX[i]
            let newYPosition = minsick.position.1 + moveY[i]

            if newXPosition < 0 || newYPosition < 0 || newXPosition >= xCount || newYPosition >= yCount {
                continue
            }

            if minsick.visited[newXPosition][newYPosition] {
                continue
            }

            switch map[newXPosition][newYPosition] {
            case "1":
                print(minsick.move+1)
                return
            case "a", "b", "c", "d", "e", "f":
                var newKey = minsick.key
                newKey.insert(map[newXPosition][newYPosition].uppercased())
                queue.append(Minsick(
                    position: (newXPosition, newYPosition),
                    move: minsick.move + 1,
                    key: newKey,
                    visited: visited))
            case "A", "B", "C", "D", "E", "F":
                if minsick.key.contains(map[newXPosition][newYPosition]) {
                    queue.append(Minsick(
                        position: (newXPosition, newYPosition),
                        move: minsick.move + 1,
                        key: minsick.key,
                        visited: minsick.visited))
                }
            case "#":
                continue
            default:
                queue.append(Minsick(
                    position: (newXPosition, newYPosition),
                    move: minsick.move + 1,
                    key: minsick.key,
                    visited: minsick.visited))
            }
        }
    }
    print(-1)
}

struct Minsick {
    let position: (Int, Int)
    let move: Int
    var key: Set<String>
    var visited: [[Bool]]
}

struct Queue1194 {
    var elements: [Minsick]
    var firstIndex: Int = 0

    var isEmpty: Bool { elements.count <= firstIndex }

    mutating func append(_ element: Minsick) {
        elements.append(element)
    }

    mutating func removeFirst() -> Minsick? {
        if isEmpty { return nil }
        firstIndex += 1
        return elements[firstIndex - 1]
    }
}
