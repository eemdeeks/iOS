//
//  2293.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/5/25.
//
import Foundation
func solution2293() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let k = input[1]
    var coins: [Int] = [0]
    for _ in 0..<n {
        coins.append(Int(readLine()!)!)
    }
    coins.sort()
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)
    for i in 1...n {
        dp[i][0] = 1
    }
    for i in 1...n {
        for j in 1...k {
            if coins[i] <= j {
                if dp[i][j-coins[i]] + dp[i-1][j] >= Int(pow(2.0, 31.0)) {
                    dp[i][j] = 0
                } else {
                    dp[i][j] = dp[i][j-coins[i]] + dp[i-1][j]
                }
            } else {
                dp[i][j] = dp[i-1][j]
            }
        }
    }
    print(dp[n][k])
}

//var answers: [[Int]] = []
//    func makeK(_ useCoin: [Int]) {
//        var value = 0
//        for i in useCoin {
//            value += i
//        }
//        if value == k {
//            answers.append(useCoin)
//            return
//        } else if value > k {
//            return
//        }
//        for coin in coins {
//            let newArray = useCoin + [coin]
//            makeK(newArray)
//        }
//    }
//
//    makeK([])
//    var realAnswer: Set<[Int]> = []
//    for answer in answers {
//        realAnswer.insert(answer.sorted())
//    }
//    print(realAnswer.count)
