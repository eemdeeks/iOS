//
//  1520.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 8/27/25.
//

// dp + 깊이우선탐색(재귀)
func solution1520() {
    let fileIO = FileIO()

    let xCount = fileIO.readInt()
    let yCount = fileIO.readInt()

    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: yCount), count: xCount)

    for x in 0..<xCount {
        for y in 0..<yCount {
            graph[x][y] = fileIO.readInt()
        }
    }


    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]

    var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: yCount), count: xCount)

    _ = dfs((0, 0))

    func dfs(_ index: (x: Int, y: Int)) -> Int {
        if index.x == xCount - 1 && index.y == yCount - 1 {
            return 1
        }

        if dp[index.x][index.y] != -1 {
            return dp[index.x][index.y]
        } else {
            dp[index.x][index.y] = 0
        }

        for i in 0..<4 {
            let newX = index.x + moveX[i]
            let newY = index.y + moveY[i]

            if newX < 0 || newX >= xCount || newY < 0 || newY >= yCount {
                continue
            }

            if graph[newX][newY] >= graph[index.x][index.y] {
                continue
            }

            dp[index.x][index.y] += dfs((newX, newY))
        }

        return dp[index.x][index.y]
    }

    print(dp[0][0])
}
