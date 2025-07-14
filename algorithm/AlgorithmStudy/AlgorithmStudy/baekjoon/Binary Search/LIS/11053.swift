//
//  11053.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/12/25.
//

func solution11053() {
    let n = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map { Int($0)! }

    var dp: [Int] = []

    for i in array {
        guard let last = dp.last else {
            dp.append(i)
            continue
        }
        if last < i { dp.append(i) }
        else {
            var start = 0
            var end = dp.count - 1

            while start < end - 1 {
                let mid = (start + end) / 2

                if dp[mid] < i {
                    start = mid
                } else {
                    end = mid
                }
            }

            if dp[start] >= i {
                dp[start] = i
            } else {
                dp[end] = i
            }
        }
    }
    print(dp.count)
}
