//
//  14003.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/9/25.
//

func solution14003() {
    let arrayCount = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map { Int($0)! }

    var dp: [Int] = []
    var locate: [Int] = []

    for i in array {
        guard let last = dp.last else {
            dp.append(i)
            locate.append(0)
            continue
        }
        if last < i {
            dp.append(i)
            locate.append(dp.count-1)
        } else {
            var min = 0
            var max = dp.count - 1
            var flag = false
            while min < max - 1 {
                var mid = (min + max) / 2

                if dp[mid] == i {
                    flag = true
                    locate.append(mid)
                    break
                } else if dp[mid] < i {
                    min = mid
                } else {
                    max = mid
                }
            }

            if flag {
                continue
            }
            if dp[min] >= i {
                dp[min] = i
                locate.append(min)
            } else {
                dp[max] = i
                locate.append(max)
            }
        }
    }
    print(dp.count)
    var answer: [String] = []
    var index = dp.count - 1
    for i in (0..<locate.count).reversed() {
        if index < 0 { break }
        if locate[i] == index {
            answer.append(String(array[i]))
            index -= 1
        }
    }

    print(answer.reversed().joined(separator: " "))
}
