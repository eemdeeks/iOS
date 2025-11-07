//
//  2169.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/7/25.
//


/*
 0행 은 왼쪽에서 오른쪽으로만 진행 가능하므로 dp[0][y] 는 누적합으로 초기화.
 이후 행은
 왼쪽에서 오른쪽으로 가면서 max 값 배열,
 오른쪽에서 왼쪽으로 가면서 max 값 배열
 이 두가지를 비교 해서 큰 값으로 dp 배열 초기화
 */
func solution2169() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var graph: [[Int]] = []
    var elements: [Int]
    var dp: [[Int]] = Array(repeating: Array(repeating: Int.min, count: m), count: n)

    for _ in 0..<n {
        elements = []
        for _ in 0..<m {
            elements.append(fileIO.readInt())
        }
        graph.append(elements)
    }
    var sum = 0
    for y in 0..<m {
        sum += graph[0][y]
        dp[0][y] = sum
    }

    var leftToRight: [Int]
    var rightToLeft: [Int]
    for x in 1..<n {
        leftToRight = [dp[x - 1][0] + graph[x][0]]
        rightToLeft = [dp[x - 1][m - 1] + graph[x][m - 1]]
        for y in 1..<m {
            leftToRight.append(max(leftToRight[y - 1], dp[x - 1][y]) + graph[x][y])
            rightToLeft.append(max(rightToLeft[y - 1], dp[x - 1][m - y - 1]) + graph[x][m - y - 1])
        }

        rightToLeft.reverse()

        for y in 0..<m {
            dp[x][y] = max(leftToRight[y], rightToLeft[y])
        }
    }
    print(dp[n - 1][m - 1])

}

/*
 5 5
 10 25 7 8 13
 68 24 -78 63 32
 12 -69 100 -29 -25
 -16 -22 -57 -33 99
 7 -76 -11 77 15

 [10, 35, 42, 50, 63]
 [172, 104, 80, 158, 145]
 [184, 160, 229, 186, 161]
 [168, 150, 172, 227, 260]
 [272, 265, 341, 352, 319]

*/

