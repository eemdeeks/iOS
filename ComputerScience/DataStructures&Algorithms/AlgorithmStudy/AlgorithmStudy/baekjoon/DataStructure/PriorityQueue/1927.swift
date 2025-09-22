//
//  PHeap.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/4/25.
//



func solution1927() {
    let input: Int = Int(readLine()!)!
    var queue: PHeap = PHeap(queue: [], sort: <)
    for _ in 0..<input {
        let oper = Int(readLine()!)!
        if oper == 0 {
            if let value = queue.removeFirst() {
                print(value)
            } else {
                print(0)
            }
        } else {
            queue.insert(oper)
        }
    }

    struct PHeap {
        var queue: [Int]
        let sort: (Int, Int) -> Bool
        var isEmpty: Bool { queue.isEmpty }

        func leftChild(of index: Int) -> Int { index * 2 + 1 }
        func rightChild(of index: Int) -> Int {
            index * 2 + 2
        }
        func parent(of index: Int) -> Int {
            (index - 1) / 2
        }

        mutating func insert(_ value: Int) {
            guard !isEmpty else {
                queue.append(value)
                return
            }

            queue.append(value)
            swimUp()
        }

        mutating func swimUp() {
            var index = queue.count - 1
            while index != 0 && sort(queue[index], queue[parent(of: index)]) {
                queue.swapAt(index, parent(of: index))
                index = parent(of: index)
            }
        }

        mutating func removeFirst() -> Int? {
            guard !isEmpty else { return nil }
            queue.swapAt(0, queue.count-1)
            let first = queue.removeLast()
            diveDown(0)
            return first
        }

        mutating func diveDown(_ index: Int) {
            var priority = index
            let left = leftChild(of: index)
            let right = rightChild(of: index)

            if left < queue.endIndex && sort(queue[left], queue[priority]) {
                priority = left
            }

            if right < queue.endIndex && sort(queue[right], queue[priority]) {
                priority = right
            }

            if priority != index {
                queue.swapAt(index, priority)
                diveDown(priority)
            }
        }
    }
}
