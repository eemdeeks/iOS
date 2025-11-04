//
//  PriorityQueue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 10/28/25.
//

func solution10282() {
    let fileIO = FileIO()
    let testCase = fileIO.readInt()

    for _ in 0..<testCase {
        let n = fileIO.readInt()    // 컴퓨터의 개수
        let d = fileIO.readInt()    // 의존성 개수
        let c = fileIO.readInt()    // 해킹당한 컴퓨터의 번호
        var computers: [[(computer: Int, time: Int)]] = Array(repeating: [], count: n + 1)
        var times: [Int] = Array(repeating: -1, count: n + 1)
        var visited: [Bool] = Array(repeating: false, count: n + 1)
        for _ in 0..<d {
            let a = fileIO.readInt()
            let b = fileIO.readInt()
            let s = fileIO.readInt()

            computers[b].append((a, s))
        }

        var priorityQueue = PriorityQueue<(computer: Int, time: Int)>(elements: [(c, 0)]) {
            $0.time < $1.time
        }
        times[c] = 0

        while !priorityQueue.isEmpty {
            guard let element = priorityQueue.removeFirst() else { continue }

            if visited[element.computer] { continue }
            visited[element.computer] = true

            for info in computers[element.computer] {
                let newTime = times[element.computer] + info.time

                if times[info.computer] == -1 {
                    times[info.computer] = newTime
                    priorityQueue.insert((info.computer, newTime))
                } else {
                    if times[info.computer] > newTime {
                        times[info.computer] = newTime
                        priorityQueue.insert((info.computer, newTime))
                    }
                }
            }
        }

        var maxTime = -1
        var virusCount = 0
        for time in times {
            if time != -1 {
                virusCount += 1
                maxTime = max(maxTime, time)
            }
        }

        print("\(virusCount) \(maxTime)")
    }

    struct PriorityQueue<T> {
        var elements: [T]
        var sort: (T, T) -> Bool
        var isEmpty: Bool { elements.isEmpty }

        func parent(of index: Int) -> Int { (index - 1) / 2 }
        func leftChild(of index: Int) -> Int { index * 2 + 1 }
        func rightChild(of index: Int) -> Int { index * 2 + 2 }

        mutating func insert(_ element: T) {
            elements.append(element)

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
            elements.swapAt(0, elements.count - 1)

            guard let element = elements.popLast() else { return nil }

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
