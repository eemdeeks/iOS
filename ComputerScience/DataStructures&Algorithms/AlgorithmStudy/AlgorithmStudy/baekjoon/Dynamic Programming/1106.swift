//
//  1106.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 6/19/25.
//


func solution1106() {
    let fileIO = FileIO()

    let c = fileIO.readInt()
    let n = fileIO.readInt()

    var cities: [[Int]] = []

    for _ in 0..<n {
        cities.append([fileIO.readInt(), fileIO.readInt()])
    }

    cities.sort { $0[0] > $1[0] }

    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 100002), count: n + 1)

    for cost in 1...100001 {
        for city in 1...n {
            if cost < cities[city - 1][0] { dp[city][cost] = dp[city - 1][cost] }
            else { dp[city][cost] = max(dp[city-1][cost], dp[city][cost - cities[city - 1][0]] + cities[city - 1][1])}
            if dp[city][cost] >= c {
                print(cost)
                return
            }
        }
    }
}

// 비용   고객 수
// 10 3
// 3 1
// 2 2
// 1 3
//      0   1   2   3   4   5   6
//      0   0   0   0   0   0   0
//3 1   0   0   0   1
//2 2   0   0   2   2
//1 3   0   3   6   9