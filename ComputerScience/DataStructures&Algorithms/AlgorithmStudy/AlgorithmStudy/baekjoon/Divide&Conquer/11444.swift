//
//  11444.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/16/25.
//

func solution11444() {
    let input = Int(readLine()!)!
    let mod = 1000000007

    print(fibonacci(input)[0][1])

    func mul(_ a: [[Int]], _ b: [[Int]]) -> [[Int]] {
        var res = [[0, 0], [0, 0]]
        for i in 0..<2 {
            for j in 0..<2 {
                for m in 0..<2 {
                    res[i][j] += a[i][m] * b[m][j]
                    res[i][j] %= mod
                }
            }
        }
        return res
    }

    func fibonacci(_ n: Int) -> [[Int]] {
        if n == 1 { return [[1, 1], [1, 0]] }

        let half = fibonacci(n / 2)
        if n % 2 == 0 {
            return mul(half, half)
        } else {
            return mul(fibonacci(1), mul(half, half))
        }
    }
}
