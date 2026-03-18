//
//  2352.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/18/26.
//


func solution2352() {
    let _ = Int(readLine()!)!

    let nodes: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

    var dp: [Int] = []

    for i in nodes {
        guard let last = dp.last else {
            dp.append(i)
            continue
        }

        if last < i {
            dp.append(i)
        } else {
            var start = 0
            var end = dp.count - 1

            while start + 1 < end {
                let mid = (start + end) / 2

                if dp[mid] > i {
                    end = mid
                } else {
                    start = mid
                }
            }

            if i <= dp[start] {
                dp[start] = i
            } else {
                dp[end] = i
            }
        }
    }

    print(dp.count)

}
