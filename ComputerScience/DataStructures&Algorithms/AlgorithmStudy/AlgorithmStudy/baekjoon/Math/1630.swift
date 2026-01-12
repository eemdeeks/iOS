//
//  1630.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 1/12/26.
//

import Foundation

func solution1630() {
    guard
        let input = readLine(),
        let n = Int(input)
    else { return }

    if n == 1 {
        print(1)
        return
    }

    var isPrime: [Bool] = Array(repeating: true, count: n + 1)
    isPrime[0] = false
    isPrime[1] = false

    var sqrtN = Int(sqrt(Double(n)))
    sqrtN = sqrtN < 2 ? n: sqrtN

    for i in 2...sqrtN where isPrime[i] {
        var index = i + i
        while index <= n {
            isPrime[index] = false
            index += i
        }
    }

    var answer = 1

    for i in 2...n where isPrime[i] {
        var maxPower = i
        while maxPower * i <= n {
            maxPower *= i
        }
        answer *= maxPower
        answer %= 987654321
    }

    print(answer % 987654321)
}
