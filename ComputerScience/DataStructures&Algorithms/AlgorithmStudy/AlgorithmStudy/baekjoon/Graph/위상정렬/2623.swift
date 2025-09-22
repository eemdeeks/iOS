//
//  2623.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/21/25.
//

func solution2623() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]

    var nodeInputCount = Array(repeating: 0, count: n + 1)
    var nodes = Array(repeating: Set<Int>(), count: n + 1)
    var inputs = Array(repeating: Set<Int>(), count: n + 1)

    for _ in 0..<m {
        let pd = readLine()!.split(separator: " ").map { Int($0)! }
        for i in 2...pd[0] {
            nodes[pd[i - 1]].insert(pd[i])
            inputs[pd[i]].insert(pd[i - 1])
        }
    }

    var stack: [Int] = []

    for i in 1...n {
        nodeInputCount[i] = inputs[i].count
        if nodeInputCount[i] == 0 {
            stack.append(i)
        }
    }

    var answer: [Int] = []
    while !stack.isEmpty {
        let node = stack.removeLast()
        answer.append(node)

        for i in nodes[node] {
            nodeInputCount[i] -= 1
            if nodeInputCount[i] == 0 {
                stack.append(i)
            }
        }
    }

    if answer.count == n {
        let answerString = answer
            .map { String($0) }
            .joined(separator: "\n")
        print(answerString)
    } else {
        print(0)
    }
}
