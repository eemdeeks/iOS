//
//  2786.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 10/21/25.
//


func solution2786() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var prices: [(a: Int, b: Int, diff: Int)] = []

    for _ in 0..<n {
        let a = fileIO.readInt()
        let b = fileIO.readInt()

        prices.append((a, b, a - b))
    }

    prices.sort { $0.b < $1.b }

    var sumB: [Int] = [prices[0].b]
    var minAs: [Int] = Array(repeating: -1, count: n)

    for index in 1..<n {
        sumB.append(sumB[index - 1] + prices[index].b)
    }

    var minA = -1
    for index in (0..<n).reversed() {
        if minA == -1 {
            minA = prices[index].a
        } else {
            minA = min(minA, prices[index].a)
        }
        minAs[index] = minA
    }

    var answers: [Int] = [minA]

    var minDiff = prices[0].diff

    for index in 1..<n {
        if minDiff > prices[index].diff {
            minDiff = prices[index].diff
        }
        let sumPrice = min(sumB[index] + minDiff, sumB[index - 1] + minAs[index])
        answers.append(sumPrice)
    }
    print(answers.map { String($0) }.joined(separator: "\n"))
}


/*
 9  3
 10 5
 10 5

 9
 13
 18

 9  5
 10 4
 10 5

 9
 13
 18

 10 5
 9  3
 11 4

 9
 13
 17


 3

 4
 13 12
 10 5
 14 8
 11 9

 10
 18
 26
 35


 4
 1 4
 10 5
 14 8
 11 9

 1
 6
 14
 23

 1 6
 2 5
 14 8
 11 9

 1
 6
 14
 23

 4
 2 5
 4 1
 14 8
 11 9

 2
 3
 11
 20

 3
 11 9
 4 1
 14 8

 4
 12
 20


 3
 12 2
 4 3
 6 17

 4
 6
 11


 2, 5, 22

 4

 */

