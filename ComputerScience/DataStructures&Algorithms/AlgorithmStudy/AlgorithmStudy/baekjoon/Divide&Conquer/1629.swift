//
//  1629.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/18/25.
//


func solution1629() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    let mod = input[2]

    print(제곱(b))

    func 제곱(_ n: Int) -> Int {
        if n == 1 {
            return a % mod
        }
        if n == 0 {
            return 1
        }
        let half = 제곱(n / 2) % mod

        if n % 2 == 0 {
            return (half * half) % mod
        } else {
            return (a * half % mod * half) % mod
        }
    }
}
