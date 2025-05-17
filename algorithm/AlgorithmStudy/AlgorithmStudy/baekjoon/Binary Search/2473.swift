//
//  2473.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/17/25.
//

func solution2473() {
    let n = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)

    var answerSum = 3000000001
    var answer: (Int, Int, Int) = (-1, -1, -1)

    for first in 0..<n - 2 {
        for second in (first + 1)..<n - 1 {
            let sum = array[first] + array[second]
            var start = second + 1
            var end = array.count - 1
            var mid: Int
            while start + 1 < end {
                mid = (start + end) / 2

                if sum + array[mid] > 0 {
                    end = mid
                } else {
                    start = mid
                }
            }

            if answerSum > abs(sum + array[start]) {
                answerSum = abs(sum + array[start])
                answer = (first, second, start)
            }

            if answerSum > abs(sum + array[end]) {
                answerSum = abs(sum + array[end])
                answer = (first, second, end)
            }

        }
    }

    print("\(array[answer.0]) \(array[answer.1]) \(array[answer.2])")
}
