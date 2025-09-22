//
//  Queue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/22/25.
//

func solution1806() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let s = input[1]

    let array = readLine()!.split(separator: " ").map { Int($0)! }

    var queue = Queue(elements: [])
    var answer = 0
    var value = 0

    for num in array {
        value += num
        queue.append(num)
        while value >= s {
            answer = answer == 0 ? queue.count: min(queue.count, answer)
            guard let first = queue.removeFirst() else { break }
            value -= first
        }
    }

    print(answer)

    struct Queue {
        var elements: [Int]
        var head: Int = 0
        var isEmpty: Bool { elements.count <= head }
        var count: Int { elements.count - head }

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
