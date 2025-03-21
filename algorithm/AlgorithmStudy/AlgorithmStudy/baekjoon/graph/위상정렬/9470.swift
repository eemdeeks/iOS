//
//  9470.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/14/25.
//

func solution9470() {
    let testCaseCount: Int = Int(readLine()!)!
    var answer: [Int] = []
    for _ in 0..<testCaseCount {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let m = input[1] // 노드의 수
        let p = input[2] // 간선의 수
        var strahler: [Int] = Array(repeating: 0, count: m + 1)
        var graph: [Set<Int>] = Array(repeating: Set<Int>(), count: m + 1)
        //그래프 입력
        for _ in 0..<p {
            let edge = readLine()!.split(separator: " ").map { Int($0)! }
            graph[edge[1]].insert(edge[0])
        }

        //위상정렬
        var graphForSort = graph
        var visitedIndex: [Int] = []
        var sortIndex: [Int] = []
        var queue: Queue9470<Int> = Queue9470()
        for index in 1..<graphForSort.count {
            if graphForSort[index].isEmpty {
                queue.append(index)
                visitedIndex.append(index)
            }
        }

        while !queue.isEmpty {
            if let pop = queue.removeFirst() {
                for i in 1...m {
                    graphForSort[i].remove(pop)
                }
                sortIndex.append(pop)
            }
            for i in 1...m {
                if !visitedIndex.contains(i) && graphForSort[i].isEmpty {
                    queue.append(i)
                    visitedIndex.append(i)
                }
            }
        }


        for index in sortIndex {
            if graph[index].isEmpty {
                strahler[index] = 1
                continue
            }
            var max = 0
            var maxCount = 0
            for node in graph[index] {
                if max == strahler[node] {
                    maxCount += 1
                } else if max < strahler[node] {
                    max = strahler[node]
                    maxCount = 0
                }
            }
            if maxCount == 0 {
                strahler[index] = max
            } else {
                strahler[index] = max + 1
            }
        }

        answer.append(strahler.max()!)
    }
    for i in 1...testCaseCount {
        print("\(i) \(answer[i-1])")
    }
}

struct Queue9470<T> {
    var queue: [T] = []
    var head: Int = 0

    var isEmpty: Bool { queue.count <= head }

    mutating func append(_ element: T) {
        queue.append(element)
    }

    mutating func removeFirst() -> T? {
        if isEmpty { return nil }
        head += 1

        return queue[head - 1]
    }
}
