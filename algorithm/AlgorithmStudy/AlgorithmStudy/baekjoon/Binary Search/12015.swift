//
//  12015.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/25/25.
//

func solution12015() {
    let n = Int(readLine()!)!

    let array = readLine()!.split(separator: " ").map { Int($0)! }
    var answer: [Int] = []

    for a in array {
        guard let last = answer.last else { answer.append(a)
            continue
        }
        if last < a {
            answer.append(a)
        } else {
            var start = 0
            var end = answer.count - 1
            while start + 1 < end {
                var mid = (start + end) / 2

                if answer[mid] < a {
                    start = mid
                } else {
                    end = mid
                }
            }

            if answer[start] >= a {
                answer[start] = a
            } else {
                answer[end] = a
            }
        }
    }
    print(answer.count)
}
