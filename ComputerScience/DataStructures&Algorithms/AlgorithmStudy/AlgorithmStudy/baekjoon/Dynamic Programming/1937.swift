//
//  1937.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/5/26.
//


func solution1937() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var bamboos: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

    for i in 0..<n {
        for j in 0..<n {
            bamboos[i][j] = fileIO.readInt()
        }
    }

    for x in 0..<n {
        for y in 0..<n {
            dp[x][y] = dfs(x: x, y: y)
        }
    }

    var answer: Int = 0

    for x in 0..<n {
        answer = max(answer, dp[x].max() ?? 0)
    }

    print(answer + 1)

    func dfs(x: Int, y: Int) -> Int {
        if dp[x][y] != 0 {
            return dp[x][y]
        }
        let moveX: [Int] = [-1, 0, 1, 0]
        let moveY: [Int] = [0, -1, 0, 1]
        var result = 0


        for i in 0..<4 {
            let newX = x + moveX[i]
            let newY = y + moveY[i]

            if newX < 0 || newY < 0 || newX >= n || newY >= n {
                continue
            }

            if bamboos[newX][newY] < bamboos[x][y] {
                result = max(dfs(x: newX, y: newY) + 1, result)
            }
        }

        dp[x][y] = result

        return result
    }

}
