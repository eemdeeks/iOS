//
//  10830.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/16/25.
//


func solution10830() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let b = input[1]
    let mod = 1000
    var array: [[Int]] = []
    for _ in 0..<n {
        array.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    var t: [[Int]] = Array(repeating: Array(repeating: 0, count: array.count), count: array.count)
    for i in 0..<array.count {
        t[i][i] = 1
    }

    for x in 제곱(b) {
        for y in x {
            print(y, terminator: " ")
        }
        print()
    }

    func mul(_ array1: [[Int]], _ array2: [[Int]]) -> [[Int]] {
        var result = Array(repeating: Array(repeating: 0, count: array.count), count: array.count)

        for i in 0..<array.count {
            for j in 0..<array.count {
                for m in 0..<array.count {
                    result[i][j] += array1[i][m] * array2[m][j]
                    result[i][j] %= mod
                }
            }
        }

        return result
    }

    func 제곱(_ n: Int) -> [[Int]] {
        if n == 1 {
            return mul(array, t)
        }
        let half = 제곱(n / 2)

        if n % 2 == 0 {
            return mul(half, half)
        } else {
            return mul(제곱(1), mul(half, half))
        }
    }
}
