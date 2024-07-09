//
//  2578.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/9/24.
//

import Foundation

func bingo() {
    var board: [[Int]] = []
    var hostedNumber: [[Int]] = []
    var boardBool: [[Int]] = Array(repeating: Array(repeating: 0, count: 5), count: 5)
    var answer: Int = 0
    for _ in 0..<5 {
        guard let input = readLine() else { return }
        board.append(input.components(separatedBy: " ").map { Int($0) ?? 0 })
    }

    for _ in 0..<5 {
        guard let input = readLine() else { return }
        hostedNumber.append(input.components(separatedBy: " ").map { Int($0) ?? 0 })
    }

    for numbers in hostedNumber {
        for number in numbers {
            answer += 1
            for i in 0..<5 {
                for j in 0..<5 {
                    if board[i][j] == number { boardBool[i][j] = 1 }
                    if isBingo(boardBool) >= 3 {
                        print(answer)
                        return
                    }
                }
            }
        }
    }



}

func isBingo(_ board: [[Int]]) -> Int {
    var answer: Int = 0
    for indexI in 0..<5 {
        if board[indexI].reduce(0, +) == 5 {
            answer += 1
        }
        var flag: Int = 0
        for indexJ in 0..<5 {
            flag += board[indexJ][indexI]
        }
        if flag == 5 {
            answer += 1
        }
    }
    var sum1 = 0
    var sum2 = 0
    for indexi in 0..<5 {
        sum1 += board[indexi][indexi]
        sum2 += board[indexi][4-indexi]
    }
    if sum1 == 5 { answer += 1 }
    if sum2 == 5 { answer += 1 }

    return answer
}
