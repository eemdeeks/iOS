//
//  4485.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/4/25.
//

func solution4485() {
    var problemNumber = 0
    while true {
        problemNumber += 1
        let n: Int = Int(readLine()!)!
        guard n != 0 else { return }
        var rupee: [[Int]] = []
        for _ in 0..<n {
            rupee.append(readLine()!.split(separator: " ").map { Int($0)! })
        }
        var answer: [[Int]] = Array(repeating: Array(repeating: 200000, count: n), count: n)
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
        let xMove = [-1, 0, 0, 1]
        let yMove = [0, -1, 1, 0]

        var startIndex = (0,0)
        answer[0][0] = rupee[0][0]
        while true {
            visited[startIndex.0][startIndex.1] = true
            for i in 0..<4 {
                let visitIndex = (startIndex.0 + xMove[i], startIndex.1 + yMove[i])
                if visitIndex.0 < 0 || visitIndex.0 >= n || visitIndex.1 < 0 || visitIndex.1 >= n {
                    continue
                }
                if visited[visitIndex.0][visitIndex.1] {
                    continue
                }
                answer[visitIndex.0][visitIndex.1] = min(answer[visitIndex.0][visitIndex.1], answer[startIndex.0][startIndex.1] + rupee[visitIndex.0][visitIndex.1])
            }

            guard let minIndex = minValueIndex() else { break }
            startIndex = minIndex
        }
        print("Problem \(problemNumber): \(answer[n-1][n-1])")

        func minValueIndex() -> (Int,Int)? {
            var minValueIndex: (Int,Int)? = nil
            var value: Int = 200000
            for i in 0..<n {
                for j in 0..<n {
                    if visited[i][j] { continue }
                    if value > answer[i][j] {
                        value = answer[i][j]
                        minValueIndex = (i,j)
                    }
                }
            }
            return minValueIndex
        }
    }
}
