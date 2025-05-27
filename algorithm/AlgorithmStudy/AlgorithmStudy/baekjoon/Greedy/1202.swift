//
//  PQ.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/27/25.
//

// 그리디, 정렬, 우선순위 큐, 집합과 맵
func solution1202() {
    let fileIO = FileIO()
    let n = fileIO.readInt()
    let k = fileIO.readInt()

    var jewel: [[Int]] = []
    var bag: [Int] = []
    var answer: Int = 0

    for _ in 0..<n {
        jewel.append([fileIO.readInt(), fileIO.readInt()])
    }

    for _ in 0..<k {
        bag.append(fileIO.readInt())
    }

    jewel.sort { $0[0] < $1[0] }

    bag.sort(by: <)

    var index = 0
    var canCarry = PQ { $0[1] > $1[1] }

    for bagValue in bag {
        while index < jewel.count {
            if jewel[index][0] > bagValue { break }
            canCarry.insert(jewel[index])
            index += 1
        }
        guard let answerJewel = canCarry.removeFirst() else { continue }
        answer += answerJewel[1]
    }

    print(answer)

    struct PQ {
        var elements: [[Int]] = []
        var isEmpty: Bool { elements.isEmpty }
        var sort: ([Int], [Int]) -> Bool

        func parent(_ index: Int) -> Int { (index - 1) / 2 }
        func leftChild(_ index: Int) -> Int { index * 2 + 1 }
        func rightChild(_ index: Int) -> Int { index * 2 + 2}

        mutating func insert(_ element: [Int]) {
            elements.append(element)
            if elements.count != 1 {
                swimUp()
            }
        }

        mutating func swimUp() {
            var index = elements.count - 1
            while index != 0 && sort(elements[index], elements[parent(index)]) {
                elements.swapAt(index, parent(index))
                index = parent(index)
            }
        }

        mutating func removeFirst() -> [Int]? {
            if isEmpty { return nil }
            elements.swapAt(0, elements.count - 1)
            let first = elements.removeLast()
            diveDown(0)

            return first
        }

        mutating func diveDown(_ index: Int) {
            var priority = index
            let left = leftChild(index)
            let right = rightChild(index)

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
