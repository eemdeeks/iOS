//
//  11660.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/22/25.
//

func solution11660() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()
    var map: [[Int]] = []
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

    for _ in 0..<n {
        var x: [Int] = []
        for _ in 0..<n {
            x.append(fileIO.readInt())
        }
        map.append(x)
    }

    for x in 0..<n {
        for y in 0..<n {
            dp[x][y] = y == 0 ? map[x][y]: dp[x][y-1] + map[x][y]
        }
    }

    var answer: [String] = []
    var x1: Int
    var y1: Int
    var x2: Int
    var y2: Int
    var value: Int

    for _ in 0..<m {
        value = 0
        x1 = fileIO.readInt() - 1
        y1 = fileIO.readInt() - 1
        x2 = fileIO.readInt() - 1
        y2 = fileIO.readInt() - 1

        for x in x1...x2 {
            value += dp[x][y2]
            if y1 != 0 { value -= dp[x][y1-1] }
        }
        answer.append(String(value))
    }

    print(answer.joined(separator: "\n"))
}
