//
//  1939.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/7/25.
//


func solution1939() {
    var input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]    // 섬 개수
    let m = input[1]    // 다리 개수
    var edges: [[Int: Int]] = Array(repeating: [:], count: n + 1)

    for _ in 0..<m {
        input = readLine()!.split(separator: " ").map { Int($0)! }
        if let value = edges[input[0]][input[1]] {
            edges[input[0]][input[1]] = max(value, input[2])
            edges[input[1]][input[0]] = max(value, input[2])
        } else {
            edges[input[0]][input[1]] = input[2]
            edges[input[1]][input[0]] = input[2]
        }
    }

    input = readLine()!.split(separator: " ").map { Int($0)! }
    let start = input[0]
    let end = input[1]
    var queue = PQueue(queue: [], sort: >)
    var islands: [Int] = Array(repeating: 0, count: n + 1)
    var visited: [Bool] = Array(repeating: false, count: n + 1)

    queue.insert([start, 0])

    while !queue.isEmpty {
        guard let saveIsland = queue.removeFirst() else { return }
        if saveIsland[0] == end {
            print(saveIsland[1])
            return
        }
        visited[saveIsland[0]] = true

        for edge in edges[saveIsland[0]] {
            if visited[edge.key] { continue }
            if islands[edge.key] < edge.value {
                islands[edge.key] = saveIsland[1] == 0 ? edge.value: min(edge.value, saveIsland[1])
                queue.insert([edge.key, islands[edge.key]])
            }
        }
    }

    struct PQueue {
        var queue: [[Int]]  // [섬 번호, 가중치]
        var sort: (Int, Int) -> Bool

        var isEmpty: Bool { queue.isEmpty }

        func left(of index: Int) -> Int { index * 2 + 1 }
        func right(of index: Int) -> Int { index * 2 + 2 }
        func parent(of index: Int) -> Int { (index - 1) / 2 }

        mutating func insert(_ element: [Int]) {
            queue.append(element)
            swimUp()
        }

        mutating func swimUp() {
            var index = queue.count - 1
            while index != 0 && sort(queue[index][1], queue[parent(of: index)][1]) {
                queue.swapAt(index, parent(of: index))
                index = parent(of: index)
            }
        }

        mutating func removeFirst() -> [Int]? {
            if isEmpty { return nil }
            queue.swapAt(0, queue.count-1)
            let priorityElement = queue.removeLast()
            diveDown(0)

            return priorityElement
        }

        mutating func diveDown(_ index: Int) {
            var priority = index
            let left = left(of: index)
            let right = right(of: index)

            if left < queue.count && sort(queue[left][1], queue[priority][1]) {
                priority = left
            }

            if right < queue.count && sort(queue[right][1], queue[priority][1]) {
                priority = right
            }

            if priority != index {
                queue.swapAt(index, priority)
                diveDown(priority)
            }
        }
    }
}
