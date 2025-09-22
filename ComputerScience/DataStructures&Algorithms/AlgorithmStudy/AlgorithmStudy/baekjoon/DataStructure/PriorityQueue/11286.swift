//
//  11286.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/9/25.
//

func solution11286() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    var heap = Heap(heap: []) {
        if abs($0) == abs($1) {
            return $0 < $1
        } else {
            return abs($0) < abs($1)
        }
    }
    var answer: [String] = []

    for _ in 0..<n {
        let value = fileIO.readInt()
        if value == 0 {
            guard let element = heap.removeFirst() else {
                answer.append("0")
                continue
            }
            answer.append("\(element)")
        } else {
            heap.insert(value)
        }
    }

    print(answer.joined(separator: "\n"))

    struct Heap {
        var heap: [Int]
        var sort: (Int, Int) -> Bool
        var isEmpty: Bool { heap.isEmpty }

        func left(of index: Int) -> Int { index * 2 + 1 }
        func right(of index: Int) -> Int { index * 2 + 2 }
        func parent(of index: Int) -> Int { (index - 1) / 2 }

        mutating func insert(_ element: Int) {
            heap.append(element)
            guard !isEmpty else { return }
            swimUp()
        }

        mutating func swimUp() {
            var index = heap.count - 1

            while index > 0 && sort(heap[index], heap[parent(of: index)]) {
                heap.swapAt(index, parent(of: index))
                index = parent(of: index)
            }
        }

        mutating func removeFirst() -> Int? {
            guard !isEmpty else { return nil }
            heap.swapAt(0, heap.count-1)
            let element = heap.removeLast()

            diveDown(0)

            return element
        }

        mutating func diveDown(_ index: Int) {
            var priority = index
            let left = left(of: index)
            let right = right(of: index)

            if left < heap.count && sort(heap[left], heap[priority]) {
                priority = left
            }

            if right < heap.count && sort(heap[right], heap[priority]) {
                priority = right
            }

            if priority != index {
                heap.swapAt(priority, index)
                diveDown(priority)
            }
        }
    }
}
