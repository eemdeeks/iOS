//
//  PriorityQueue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 8/27/25.
//


func solution17835() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()
    let k = fileIO.readInt()

    var loadToCity: [[(base: Int, value: Int)]] = Array(repeating: [], count: n + 1)
    var ks: [Int] = []

    for _ in 0..<m {
        let base = fileIO.readInt()
        let destination = fileIO.readInt()
        let value = fileIO.readInt()
        loadToCity[destination].append((base, value))
    }

    for _ in 0..<k {
        ks.append(fileIO.readInt())
    }

    var visited: [Bool] = Array(repeating: false, count: n + 1)
    var cities: [Int] = Array(repeating: -1, count: n + 1)

    var queue = PriorityQueue(elements: [], sort: <)

    for node in ks {
        queue.insert((node, 0))
        cities[node] = 0
    }

    while !queue.isEmpty {
        guard let node = queue.removeFirst() else { break }

        if visited[node.node] { continue }
        visited[node.node] = true

        for load in loadToCity[node.node] {
            let newValue = node.value + load.value

            if cities[load.base] == -1 || cities[load.base] > newValue {
                cities[load.base] = newValue
                queue.insert((load.base, newValue))
            }
        }
    }

    var maxValue = 0
    var maxCity = 0
    for i in 1...n {
        if maxValue < cities[i] {
            maxValue = cities[i]
            maxCity = i
        }
    }

    print(maxCity)
    print(maxValue)

    struct PriorityQueue {
        var elements: [(node: Int, value: Int)]
        var isEmpty: Bool { elements.isEmpty }
        let sort: (Int, Int) -> Bool

        func parent(_ index: Int) -> Int { (index - 1) / 2 }
        func leftChild(_ index: Int) -> Int { index * 2 + 1}
        func rightChild(_ index: Int) -> Int { index * 2 + 2}

        mutating func insert(_ element: (node: Int, value: Int)) {
            elements.append(element)
            swimUp()
        }

        mutating func swimUp() {
            var index = elements.count - 1

            while index > 0 && sort(elements[index].value, elements[parent(index)].value) {
                elements.swapAt(index, parent(index))
                index = parent(index)
            }
        }

        mutating func removeFirst() -> (node: Int, value: Int)? {
            if isEmpty { return nil }
            elements.swapAt(0, elements.count - 1)

            let element = elements.removeLast()

            diveDown(0)

            return element
        }

        mutating func diveDown(_ index: Int) {
            var priority = index
            let left = leftChild(index)
            let right = rightChild(index)

            if left < elements.count && sort(elements[left].value, elements[priority].value) {
                priority = left
            }

            if right < elements.count && sort(elements[right].value, elements[priority].value) {
                priority = right
            }

            if priority != index {
                elements.swapAt(index, priority)
                diveDown(priority)
            }
        }
    }
}
