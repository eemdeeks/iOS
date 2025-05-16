//
//  2467.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/16/25.
//

func solution2467() {
    let n = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map { Int($0)! }
    var answer: (Int, Int) = (-1, -1)
    var answerNum: Int = 2000000001

    for first in 0..<array.count-1 {

        var start = first + 1
        var end = array.count - 1
        var mid: Int

        while start + 1 < end {
            mid = (start + end) / 2

            if array[first] + array[mid] > 0 {
                end = mid
            } else {
                start = mid
            }
        }

        if answerNum > abs(array[first] + array[start]) {
            answerNum = abs(array[first] + array[start])
            answer = (first, start)
        }

        if answerNum > abs(array[first] + array[end]) {
            answerNum = abs(array[first] + array[end])
            answer = (first, end)
        }
    }

    print("\(array[answer.0]) \(array[answer.1])")
}
