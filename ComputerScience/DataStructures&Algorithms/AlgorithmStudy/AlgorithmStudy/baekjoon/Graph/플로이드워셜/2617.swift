//
//  2617.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 10/2/25.
//


func solution2617() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var graph: [[Int]] = Array(repeating: Array(repeating: -1, count: n + 1), count: n + 1)
    var reverseGraph: [[Int]] = Array(repeating: Array(repeating: -1, count: n + 1), count: n + 1)

    for _ in 0..<m {
        let first = fileIO.readInt()
        let second = fileIO.readInt()

        graph[first][second] = 1
        reverseGraph[second][first] = 1
    }

    for i in 1...n {
        for x in 1...n where graph[x][i] != -1 {
            for y in 1...n where x != y {
                if graph[i][y] != -1 {
                    graph[x][y] = 1
                }
            }
        }
    }

    for i in 1...n {
        for x in 1...n where reverseGraph[x][i] != -1 {
            for y in 1...n where x != y {
                if reverseGraph[i][y] != -1 {
                    reverseGraph[x][y] = 1
                }
            }
        }
    }

    var answers: Set<Int> = []
    let half = (n + 1)/2
    for x in 1...n {
        var count = 0
        var reverseCount = 0
        for y in 1...n where x != y {
            if graph[x][y] != -1 { count += 1 }
            if reverseGraph[x][y] != -1 { reverseCount += 1}
        }
        if count >= half || reverseCount >= half {
            answers.insert(x)
        }
    }

    print(answers.count)
}
