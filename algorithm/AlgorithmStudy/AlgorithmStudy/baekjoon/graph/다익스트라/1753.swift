//
//  PQueue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/4/25.
//

func solution1753() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let v = input[0]    // 정점의 개수
    let e = input[1]     // 간선의 개수
    let k = Int(readLine()!)!   // 시작 노드
    var map: [[[Int]]] = Array(repeating: [], count: v + 1) // [출발지][[도착지, 가중치], ....]
    var dp: [Int] = Array(repeating: 200001, count: v + 1)  // 최단거리

    for _ in 0..<e {
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        map[edge[0]].append([edge[1], edge[2]])
    }

    dp[k] = 0

    var queue = PQueue(queue: [], sort: <)

    queue.insert([k, 0])

    while !queue.isEmpty {
        guard let edgeInfo = queue.removeFirst() else { break }
        for edge in map[edgeInfo[0]] {
            if dp[edge[0]] > edge[1] + edgeInfo[1] {
                dp[edge[0]] = edge[1] + edgeInfo[1]
                queue.insert([edge[0], dp[edge[0]]])
            }
        }
    }

    for answerIndex in 1...v {
        print(dp[answerIndex] == 200001 ? "INF": dp[answerIndex])
    }

    struct PQueue {
        var queue: [[Int]]
        var sort: (Int, Int) -> Bool
        var isEmpty: Bool { queue.isEmpty }

        func leftChild(of index: Int) -> Int { index * 2 + 1 }
        func rightChild(of index: Int) -> Int { index * 2 + 2 }
        func parent(of index: Int) -> Int { (index - 1) / 2}

        mutating func insert(_ value: [Int]) {
            if isEmpty {
                queue.append(value)
                return
            }
            queue.append(value)
            swimUp()
        }

        mutating func swimUp() {
            var index = queue.count - 1
            while index != 0 && sort(queue[index][1], queue[parent(of: index)][1]) {
                queue.swapAt(index, parent(of: index))
                index = parent(of: index)
            }
        }

        mutating func removeFirst() -> [Int]? {
            guard !isEmpty else { return nil }
            queue.swapAt(0, queue.count-1)
            let first = queue.removeLast()
            diveDown(0)

            return first
        }

        mutating func diveDown(_ index: Int) {
            var priority = index
            let leftChild = leftChild(of: index)
            let rightChild = rightChild(of: index)

            if leftChild < queue.count && sort(queue[leftChild][1], queue[priority][1]) {
                priority = leftChild
            }

            if rightChild < queue.count && sort(queue[rightChild][1], queue[priority][1]) {
                priority = rightChild
            }

            if priority != index {
                queue.swapAt(priority, index)
                diveDown(priority)
            }
        }
    }
}
