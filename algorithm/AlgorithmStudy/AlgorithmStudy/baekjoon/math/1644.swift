//
//  1644.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 8/12/25.
//

// 에라토스테네스의 체, 소수 판정, 두 포인터
func solution1644() {
    let n = Int(readLine()!)!

    var isPrimes: [Bool] = Array(repeating: true, count: n + 1)
    var primes: [Int] = []

    var num: Int = 0
    for i in 2..<isPrimes.count where isPrimes[i] {
        num += i
        primes.append(num)
        for j in stride(from: i * i, to: isPrimes.count, by: i) {
            isPrimes[j] = false
        }
    }

    var startPoint: Int = -1
    var endPoint: Int = -1
    var answer: Int = 0

    while endPoint < primes.count {
        if startPoint == endPoint {
            endPoint += 1
            continue
        }
        let startValue: Int = startPoint == -1 ? 0: primes[startPoint]
        let endValue: Int = endPoint == -1 ? 0: primes[endPoint]
        let value: Int = endValue - startValue

        if value < n {
            endPoint += 1
        } else if value > n {
            startPoint += 1
        } else {
            answer += 1
            endPoint += 1
        }
    }

    print(answer)
}

