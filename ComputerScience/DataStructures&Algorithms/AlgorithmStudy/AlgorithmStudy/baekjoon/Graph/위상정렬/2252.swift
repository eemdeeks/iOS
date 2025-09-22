//
//  2252.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/26/25.
//

func solution2252() {
    let fileIO = FileIO()
    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var map : [Set<Int>] = Array(repeating: [], count: n + 1)
    var edgeCount: [Int] = Array(repeating: 0, count: n + 1)
    var a: Int
    var b: Int
    var queue = Queue(elements: [])
    var answer: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: n + 1)

    for _ in 0..<m {
        a = fileIO.readInt()
        b = fileIO.readInt()
        map[a].insert(b)
        edgeCount[b] += 1
    }

    for i in 1...n {
        if edgeCount[i] == 0 {
            queue.append(i)
            visited[i] = true
        }
    }

    while !queue.isEmpty {
        guard let first = queue.removeFirst() else { break }
        answer.append(first)
        for num in map[first] {
            edgeCount[num] -= 1
            if edgeCount[num] == 0 && !visited[num]{
                queue.append(num)
            }
        }
    }

    print(answer.map { String($0) }.joined(separator: " "))

    struct Queue {
        var elements: [Int]
        var head: Int = 0
        var isEmpty: Bool { elements.count <= head }

        mutating func append(_ element: Int) {
            elements.append(element)
        }

        mutating func removeFirst() -> Int? {
            guard !isEmpty else { return nil }
            head += 1
            return elements[head - 1]
        }
    }
}
