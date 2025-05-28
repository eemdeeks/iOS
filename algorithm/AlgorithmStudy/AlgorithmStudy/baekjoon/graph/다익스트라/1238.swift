//
//  PQ.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/28/25.
//

// 다익스트라, 최단 경로
func solution1238() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()
    let partyNumber = fileIO.readInt()

    var startEdges: [[[Int]]] = Array(repeating: [], count: n + 1)
    var arriveEdges: [[[Int]]] = Array(repeating: [], count: n + 1)

    var partyArrive: [Int] = Array(repeating: 1000001, count: n + 1)
    var partyStart: [Int] = Array(repeating: 1000001, count: n + 1)


    for _ in 0..<m {
        let x = fileIO.readInt()
        let y = fileIO.readInt()
        let value = fileIO.readInt()

        startEdges[x].append([y, value])
        arriveEdges[y].append([x, value])
    }

    partyStart[partyNumber] = 0
    partyArrive[partyNumber] = 0

    var startHeap = PQ(elements: [[partyNumber, 0]]) { $0[1] < $1[1] }
    var arriveHeap = PQ(elements: [[partyNumber, 0]]) { $0[1] < $1[1] }

    while !startHeap.isEmpty {
        guard let number = startHeap.removeFirst() else { return }

        if partyStart[number[0]] < number[1] { continue }

        for edge in startEdges[number[0]] {
            if edge[1] + number[1] < partyStart[edge[0]] {
                partyStart[edge[0]] = edge[1] + number[1]
                startHeap.insert([edge[0], partyStart[edge[0]]])
            }
        }
    }

    while !arriveHeap.isEmpty {
        guard let number = arriveHeap.removeFirst() else { return }

        if partyArrive[number[0]] < number[1] { continue }

        for edge in arriveEdges[number[0]] {
            if edge[1] + number[1] < partyArrive[edge[0]] {
                partyArrive[edge[0]] = edge[1] + number[1]
                arriveHeap.insert([edge[0], partyArrive[edge[0]]])
            }
        }
    }

    var answer: [Int] = Array(repeating: -1, count: n + 1)
    for i in 1...n {
        if i == partyNumber { continue }
        answer[i] = partyArrive[i] + partyStart[i]
    }

    print(answer.max()!)

    struct PQ {
        var elements: [[Int]] = []
        var isEmpty: Bool { elements.isEmpty }
        var sort: ([Int], [Int]) -> Bool

        func leftChild(of index: Int) -> Int { index * 2 + 1 }
        func rightChild(of index: Int) -> Int { index * 2 + 2 }
        func parent(of index: Int) -> Int { (index - 1) / 2 }

        mutating func insert(_ element: [Int]) {
            elements.append(element)
            if isEmpty { return }
            swimUp()
        }

        mutating func swimUp() {
            var index = elements.count - 1

            while index != 0 && sort(elements[index], elements[parent(of: index)]) {
                elements.swapAt(index, parent(of: index))
                index = parent(of: index)
            }
        }

        mutating func removeFirst() -> [Int]? {
            guard !isEmpty else { return nil }

            elements.swapAt(0, elements.count - 1)
            let value = elements.removeLast()
            diveDown(0)

            return value
        }

        mutating func diveDown(_ index: Int) {
            var priority = index
            let leftChild = leftChild(of: index)
            let rightChild = rightChild(of: index)

            if leftChild < elements.count && sort(elements[leftChild], elements[priority]) {
                priority = leftChild
            }

            if rightChild < elements.count && sort(elements[rightChild], elements[priority]) {
                priority = rightChild
            }

            if priority != index {
                elements.swapAt(priority, index)
                diveDown(priority)
            }
        }
    }
}
