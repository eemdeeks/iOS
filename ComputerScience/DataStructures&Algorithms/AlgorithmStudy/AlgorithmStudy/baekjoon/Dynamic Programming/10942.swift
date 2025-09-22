//
//  10942.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/20/25.
//

func solution10942() {
    let fileIO = FileIO()
    let n = fileIO.readInt()

    var array: [Int] = []
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

    for i in 0..<n {
        array.append(fileIO.readInt())
        dp[i][i] = 1
        if i == 0 { continue }
        if array[i] == array[i - 1] {
            dp[i - 1][i] = 1
        }
    }

    for i in 2..<n {    // 더하는 수
        for j in 0..<n {    // x
            if j + i >= n { break }
            if dp[j + 1][j + i - 1] == 1 && array[j] == array[j + i] {
                dp[j][j + i] = 1
            }
        }
    }

    let m = fileIO.readInt()

    var start: Int
    var end: Int

    var answer = ""
    for _ in 0..<m {
        start = fileIO.readInt() - 1
        end = fileIO.readInt() - 1
        answer.append(String(dp[start][end]) + "\n")
    }
    answer.removeLast()

    print(answer)
}
