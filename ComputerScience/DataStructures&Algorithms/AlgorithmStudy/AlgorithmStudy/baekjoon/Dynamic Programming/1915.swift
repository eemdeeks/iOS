//
//  1915.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/7/25.
//


/*
 DP 배열 선언 후,
 값이 0 인 경우 0으로
 값이 1 인 경우 DP배열의 (-1, 0), (0, -1), (-1, -1) 값중 min 값에 += 1 으로 입력.
 */

func solution1915() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var graph: [[Int]] = []
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    var elements: [Int]

    var answer = 0

    for _ in 0..<n {
        elements = fileIO.readString().map { Int(String($0))! }
        graph.append(elements)
    }

    for x in 1...n {
        for y in 1...m {
            if graph[x - 1][y - 1] == 1 {
                dp[x][y] = min(dp[x - 1][y], dp[x][y - 1], dp[x - 1][y - 1]) + 1
                answer = max(answer, dp[x][y])
            }
        }
    }
    
    print(answer * answer)

}

/*
 0 1 0 0
 0 1 1 1
 1 1 1 0
 0 0 1 0

 0 1 0 0
 0 1 1 1
 1 1 2 0
 0 0 1 0

 0 1 0 0 0
 0 1 1 1 1
 0 1 1 1 0
 0 1 1 1 0
 0 1 1 0 0

 0 1 0 0 0
 0 1 1 1 1
 0 1 2 2 0
 0 1 2 3 0
 0 1 2 0 0

 0 1 1 1 1
 1 1 1 1 1
 1 1 1 1 1
 1 1 1 1 1
 0 0 1 1 1

 0 1 1 1 1
 1 1 2 2 2
 1 2 2 3 3
 1 2 3 3 4
 0 0 1 2 3


 */
