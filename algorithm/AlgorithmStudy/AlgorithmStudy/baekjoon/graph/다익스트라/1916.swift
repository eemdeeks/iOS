//
//  PQueue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 6/23/25.
//

func solution1916() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var buses: [[(Int, Int)]] = Array(repeating: [], count: n + 1)  // [출발지](도착지, 비용)
    for _ in 0..<m {
        buses[fileIO.readInt()].append((fileIO.readInt(), fileIO.readInt()))
    }

    let start = fileIO.readInt()
    let end = fileIO.readInt()
    var costs: [Int] = Array(repeating: -1, count: n + 1)
    var visited: [Bool] = Array(repeating: false, count: n + 1)

    costs[start] = 0

    var queue = PQueue<(Int, Int)>(elements: []) {
        $0.1 < $1.1
    }

    queue.insert(element: (start, 0))

    while !queue.isEmpty {
        guard let element = queue.removeFirst() else { return }

        if element.0 == end {
            print(element.1)
            return
        }
        if visited[element.0] { continue }
        visited[element.0] = true

        for bus in buses[element.0] {
            if costs[bus.0] == -1 {
                costs[bus.0] = bus.1 + element.1
                queue.insert(element: (bus.0, costs[bus.0]))

            } else {
                if costs[bus.0] > bus.1 + element.1 {
                    costs[bus.0] = bus.1 + element.1
                    queue.insert(element: (bus.0, costs[bus.0]))
                }
            }
        }
    }

    struct PQueue<T> {
        var elements: [T]
        var sort: (T, T) -> Bool
        var isEmpty: Bool { elements.isEmpty }

        func parent(of index: Int) -> Int { (index - 1) / 2 }
        func leftChild(of index: Int) -> Int { index * 2 + 1 }
        func rightChild(of index: Int) -> Int { index * 2 + 2 }

        mutating func insert(element: T) {
            elements.append(element)
            if elements.isEmpty { return }
            swimUp()
        }

        mutating func swimUp() {
            var index = elements.count - 1

            while index != 0 && sort(elements[index], elements[parent(of: index)]) {
                elements.swapAt(index, parent(of: index))
                index = parent(of: index)
            }
        }

        mutating func removeFirst() -> T? {
            if elements.isEmpty { return nil }
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
