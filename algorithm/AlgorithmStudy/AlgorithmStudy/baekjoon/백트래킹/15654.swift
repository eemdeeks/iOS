//
//  15654.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/14/25.
//

func solution15654() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]

    var prob = readLine()!.split(separator: " ").map { Int($0)! }
    var answer: [[String]] = []
    prob.sort()

    pick(array: [], visited: Array(repeating: false, count: n))

    print(answer.map { $0.joined(separator: " ")}.joined(separator: "\n"))

    func pick(array: [Int], visited: [Bool]) {
        if array.count == m {
            answer.append(array.map { String($0) })
            return
        }
        for i in 0..<n {
            guard !visited[i] else { continue }
            var newVisited = visited
            newVisited[i] = true
            pick(array: array + [prob[i]], visited: newVisited)
        }
    }
}

