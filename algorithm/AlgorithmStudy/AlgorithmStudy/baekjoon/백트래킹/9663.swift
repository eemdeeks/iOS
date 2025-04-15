//
//  9663.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/14/25.
//

func solution9663() {
    let n = Int(readLine()!)!
    var answer = 0

    queen(queens: [])

    print(answer)

    func queen(queens: [Int]) {
        if queens.count == n {
            answer += 1
            return
        }

        for y in 0..<n {
            var flag = true
            for x in 0..<queens.count {
                if queens[x] == y {
                    flag = false
                    break
                }

                if abs(x - queens.count) == abs(y - queens[x]) {
                    flag = false
                    break
                }
            }
            if flag { queen(queens: queens + [y]) }
        }
    }
}
