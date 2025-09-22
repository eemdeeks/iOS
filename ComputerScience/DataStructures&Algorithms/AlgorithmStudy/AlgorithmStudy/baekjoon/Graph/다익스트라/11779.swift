//
//  PQueue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 6/26/25.
//


func solution11779() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var buses: [[(def: Int, cost: Int)]] = Array(repeating: [], count: n + 1)

    for _ in 0..<m {
        buses[fileIO.readInt()].append((fileIO.readInt(), fileIO.readInt()))
    }

    let start = fileIO.readInt()
    let end = fileIO.readInt()

    var costs: [Int] = Array(repeating: -1, count: n + 1)
    var route: [[Int]] = Array(repeating: [], count: n + 1)
    var visited: [Bool] = Array(repeating: false, count: n + 1)

    var queue = PQueue<(def: Int, cost: Int)>(elements: []) {
        $0.cost < $1.cost
    }

    queue.insert((start, 0))
    costs[start] = 0

    while !queue.isEmpty {
        guard let element = queue.removeFirst() else { return }

        if element.def == end {
            break
        }

        if visited[element.def] { continue }
        visited[element.def] = true

        for bus in buses[element.def] {
            if costs[bus.def] == -1 || costs[bus.def] > element.cost + bus.cost {
                costs[bus.def] = element.cost + bus.cost
                queue.insert((bus.def, costs[bus.def]))
                route[bus.def] = route[element.def] + [element.def]
            }
        }
    }
    print(costs[end])
    print(route[end].count + 1)
    print((route[end] + [end]).map { String($0) }.joined(separator: " "))

    struct PQueue<T> {
        var elements: [T]
        var sort: (T, T) -> Bool
        var isEmpty: Bool { elements.isEmpty }

        func parent(of index: Int) -> Int { (index - 1) / 2 }
        func leftChild(of index: Int) -> Int { index * 2 + 1 }
        func rightChild(of index: Int) -> Int { index * 2 + 2 }

        mutating func insert(_ element: T) {
            elements.append(element)
            if isEmpty { return }
            swimUp()
        }

        mutating func swimUp() {
            var index = elements.count - 1

            while index > 0 && sort(elements[index], elements[parent(of: index)]) {
                elements.swapAt(index, parent(of: index))
                index = parent(of: index)
            }
        }

        mutating func removeFirst() -> T? {
            guard !isEmpty else { return nil }
            elements.swapAt(0, elements.count - 1)
            let element = elements.removeLast()
            diveDown(0)

            return element
        }

        mutating func diveDown(_ index: Int) {
            var priority = index
            let left = leftChild(of: index)
            let right = rightChild(of: index)

            if left < elements.count && sort(elements[left], elements[priority]) {
                priority = left
            }

            if right < elements.count && sort(elements[right], elements[priority]) {
                priority = right
            }

            if priority != index {
                elements.swapAt(priority, index)
                diveDown(priority)
            }
        }
    }
}
