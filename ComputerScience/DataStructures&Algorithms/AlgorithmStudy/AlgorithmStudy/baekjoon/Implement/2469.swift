//
//  2469.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/10/26.
//


func solution2469() {
    let fileIO = FileIO()

    let k = fileIO.readInt()
    let n = fileIO.readInt()
    var answerResult = fileIO.readString().map { String($0) }
    var problemRow: Int = 0

    var ladders: [[String]] = []

    for i in 0..<n {
        let sticks = fileIO.readString().map { String($0) }
        if sticks[0] == "?" { problemRow = i }
        ladders.append(sticks)
    }

    var result = (0..<k).map { String(UnicodeScalar(65 + UInt8($0))) }

    for i in 0..<problemRow {
        for y in 0..<k - 1 {
            if ladders[i][y] == "-" {
                result.swapAt(y, y + 1)
            }
        }
    }

    for i in (problemRow + 1..<n).reversed() {
        for y in 0..<k - 1 {
            if ladders[i][y] == "-" {
                answerResult.swapAt(y, y + 1)
            }
        }
    }

    var answer: String = ""

    for i in 0..<k - 1 {
        if result[i] != answerResult[i] {
            answer.append("-")
            result.swapAt(i, i + 1)
            if result[i] != answerResult[i] {
                print(String(repeating: "x", count: k - 1))
                return
            }
        } else {
            answer.append("*")
        }
    }

    print(answer)
}

