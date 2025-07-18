//
//  Heap.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/18/25.
//

func solution1766() {
    let fileIO = FileIO()
    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var inputCounts: [Int] = Array(repeating: 0, count: n + 1)
    var visited: [Bool] = Array(repeating: false, count: n + 1)

    for _ in 0..<m {
        let start = fileIO.readInt()
        let end = fileIO.readInt()

        graph[start].append(end)
        inputCounts[end] += 1
    }

    var heap = Heap { $0 < $1 }

    for index in 1...n {
        if inputCounts[index] == 0 {
            heap.insert(index)
        }
    }

    var answer: [String] = []

    while answer.count != n {
        guard
            let problemNumber = heap.removeFirst(),
            !visited[problemNumber]
        else { continue }

        answer.append(String(problemNumber))

        for problem in graph[problemNumber] {
            inputCounts[problem] -= 1
            if inputCounts[problem] == 0 {
                heap.insert(problem)
            }
        }
    }

    print(answer.joined(separator: " "))

    struct Heap {
        var elements: [Int] = []
        var sort: (Int, Int) -> Bool
        var isEmpty: Bool { elements.isEmpty }

        func parents(of index: Int) -> Int { (index - 1) / 2}
        func leftChild(of index: Int) -> Int { index * 2 + 1 }
        func rightChild(of index: Int) -> Int { index * 2 + 2 }

        mutating func insert(_ element: Int) {
            elements.append(element)
            if elements.count == 1 { return }
            swimUp()
        }

        mutating func swimUp() {
            var index = elements.count - 1

            while index > 0 && sort(elements[index], elements[parents(of: index)]) {
                elements.swapAt(index, parents(of: index))
                index = parents(of: index)
            }
        }

        mutating func removeFirst() -> Int? {
            guard !isEmpty else { return nil }
            elements.swapAt(elements.count - 1, 0)
            let element = elements.removeLast()

            diveDown(0)

            return element
        }

        mutating func diveDown(_ index: Int) {
            var priority = index
            var left = leftChild(of: index)
            var right = rightChild(of: index)

            if left < elements.count && sort(elements[left], elements[priority]) {
                priority = left
            }

            if right < elements.count && sort(elements[right], elements[priority]) {
                priority = right
            }

            if priority != index {
                elements.swapAt(index, priority)
                diveDown(priority)
            }
        }
    }
}
