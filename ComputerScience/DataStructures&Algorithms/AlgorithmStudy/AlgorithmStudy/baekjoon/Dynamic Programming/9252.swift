//
//  9252.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/24/25.
//

func solution9252() {
    let input1 = readLine()!.map { String($0) }
    let input2 = readLine()!.map { String($0) }

    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: input1.count + 1), count: input2.count + 1)

    for x in 1...input2.count {
        for y in 1...input1.count {
            if input1[y-1] == input2[x-1] {
                dp[x][y] = dp[x-1][y-1] + 1
            } else {
                dp[x][y] = max(dp[x-1][y], dp[x][y-1])
            }
        }
    }

    print(dp[input2.count][input1.count])
    var max = dp[input2.count][input1.count]
    var answer: String = ""
    var x = input2.count
    var y = input1.count
    while max != 0 {
        if dp[x - 1][y] == dp[x][y] {
                x -= 1
                continue
            }
            if dp[x][y - 1] == dp[x][y] {
                y -= 1
                continue
            }
            answer = input1[y-1] + answer
            y -= 1
            x -= 1
            max -= 1
    }
    if answer.count > 0 {
        print(answer)
    }
}
