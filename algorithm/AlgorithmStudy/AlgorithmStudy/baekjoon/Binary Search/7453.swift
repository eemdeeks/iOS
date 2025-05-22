//
//  7453.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/22/25.
//

// 정렬, 이분탐색, 두 포인터, 중간에서 만나기
func solution7453() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var a: [Int] = []
    var b: [Int] = []
    var c: [Int] = []
    var d: [Int] = []

    for _ in 0..<n {
        a.append(fileIO.readInt())
        b.append(fileIO.readInt())
        c.append(fileIO.readInt())
        d.append(fileIO.readInt())
    }

    var leftCompared: [Int] = []
    var rightCompared: [Int: Int] = [:]

    for i in 0..<n {
        for j in 0..<n {
            leftCompared.append(a[i] + b[j])
            if let value = rightCompared[c[i] + d[j]] {
                rightCompared[c[i] + d[j]] = value + 1
            } else {
                rightCompared[c[i] + d[j]] = 1
            }
        }
    }

    var answer: Int = 0

    for leftValue in leftCompared {
        if let value = rightCompared[leftValue * -1] {
            answer += value
        }
    }

    print(answer)
}
