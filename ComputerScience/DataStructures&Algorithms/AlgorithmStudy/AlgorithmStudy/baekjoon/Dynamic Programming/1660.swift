//
//  1660.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/6/26.
//


func solution1660() {
    let n = Int(readLine()!)!

    var dp: [Int] = [1]
    var fourShapes: [Int] = [1]
    var index: Int = 1

    while
        let maxShape = fourShapes.last,
        let maxDp = dp.last,
            maxShape < n {
        index += 1

        dp.append(maxDp + index)
        fourShapes.append(maxShape + maxDp + index)
    }


    var answerDp: [Int] = []

    for i in 0...n {
        answerDp.append(i)
    }

    for shape in fourShapes {
        if shape > n {
            break
        }
        for i in shape...n {
            answerDp[i] = min(answerDp[i], answerDp[i - shape] + 1)
        }
    }


    print(answerDp[n])
}

