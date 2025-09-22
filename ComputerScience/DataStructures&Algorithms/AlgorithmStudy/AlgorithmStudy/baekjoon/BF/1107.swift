//
//  1107.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 9/22/25.
//


func solution1107() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()
    var canNotUseNumbers: Set<String> = []

    for _ in 0..<m {
        canNotUseNumbers.insert(fileIO.readString())
    }

    var answer = abs(n - 100)

    var index = n
    var oper = 0
    while index <= 1000000 {
        let stringNumber = String(index)

        if index >= 0 {
            var flag = true
            for number in stringNumber {
                if canNotUseNumbers.contains(String(number)) {
                    flag = false
                    continue
                }
            }

            if flag {
                answer = min(abs(n - index) + stringNumber.count, answer)
                break
            }
        }

        oper += 1
        if oper % 2 == 1 {
            index -= oper
        } else {
            index += oper
        }
    }

    print(answer)

}
