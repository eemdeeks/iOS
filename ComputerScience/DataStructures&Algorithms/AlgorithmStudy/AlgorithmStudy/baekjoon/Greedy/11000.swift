//
//  11000.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/10/25.
//

func solution11000() {
    let input: Int = Int(readLine()!)!
    var rooms = Heap {
        $0 < $1
    }
    var classes: [[Int]] = []

    for _ in 0..<input {
        classes.append(readLine()!.split(separator: " ").map { Int($0)!})
    }
    classes.sort {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        } else {
            return $0[0] < $1[0]
        }
    }
    for classTime in classes {
        if rooms.isEmpty {
            rooms.insert(node: classTime[1])
        } else {
            if rooms.peek ?? 0 <= classTime[0] { rooms.remove() }
            rooms.insert(node: classTime[1])
        }
    }
    print(rooms.count)
}

struct Heap {
    private var elements: [Int] = []
    private var sortFunction: (Int, Int) -> Bool

    var isEmpty: Bool { elements.isEmpty }
    var peek: Int? { self.elements.first }
    var count: Int { elements.count }

    init(elements: [Int] = [], sortFunction: @escaping (Int, Int) -> Bool) {
        self.elements = elements
        self.sortFunction = sortFunction
        if !elements.isEmpty { }
    }

    func leftChild(of index: Int) -> Int { index * 2 + 1 }

    func rightChild(of index: Int) -> Int { index * 2 + 2 }

    func parent(of index: Int) -> Int { (index - 1) / 2 }

    mutating func swimUp() {
        var index = count-1
        while index != 0 && sortFunction(elements[index], elements[parent(of: index)]) {
            elements.swapAt(index, parent(of: index))
            index = self.parent(of: index)
        }
    }

    mutating func insert(node: Int) {
        if elements.isEmpty {
            elements.append(node)
            return
        }
        elements.append(node)
        swimUp()
    }

    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = leftChild(of: index)
        let rightIndex = rightChild(of: index)

        if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
            higherPriority = leftIndex
        }
        // 오른쪽 자식 노드가 더 우선순위가 높을 때
        if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
            higherPriority = rightIndex
        }
        // 교환이 필요한 경우는 교환 후 서브트리로 이동
        if higherPriority != index {
            self.elements.swapAt(higherPriority, index)
            self.diveDown(from: higherPriority)
        }
    }

    mutating func remove() -> Int? {
        if isEmpty { return nil }
        elements.swapAt(0, elements.count-1)
        let deleted = elements.removeLast()
        diveDown(from: 0)

        return deleted
    }
}
