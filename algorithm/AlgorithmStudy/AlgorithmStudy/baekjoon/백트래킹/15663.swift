//
//  15663.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/17/25.
//

func solution15663() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]
    var array = readLine()!.split(separator: " ").map { Int($0)! }
    array.sort()
    var answer: [[Int]] = []
    var visited: Set<[Int]> = []

    순열([], visitedIndex: [])

    print(answer.map { $0.map { String($0) }.joined(separator: " ")}.joined(separator: "\n"))

    func 순열(_ select: [Int], visitedIndex: Set<Int>) {
        if select.count == m {
            guard !visited.contains(select) else { return }
            visited.insert(select)
            answer.append(select)
            return
        }

        for i in 0..<n {
            if visitedIndex.contains(i) { continue }
            var newVisitedIndex = visitedIndex
            newVisitedIndex.insert(i)

            순열(select + [array[i]], visitedIndex: newVisitedIndex)
        }
    }

}
