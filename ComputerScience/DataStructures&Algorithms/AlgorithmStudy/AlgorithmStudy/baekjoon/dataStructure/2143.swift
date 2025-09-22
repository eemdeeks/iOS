//
//  File.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/3/25.
//

func solution2143() {
    let fileIO = FileIO()

    let t = fileIO.readInt()

    let n = fileIO.readInt()
    var a: [Int] = []
    for i in 0..<n {
        if i == 0 { a.append(fileIO.readInt()) }
        else { a.append(fileIO.readInt() + a[i - 1]) }
    }

    let m = fileIO.readInt()
    var b: [Int] = []
    for i in 0..<m {
        if i == 0 { b.append(fileIO.readInt()) }
        else { b.append(fileIO.readInt() + b[i - 1]) }
    }

    var dict: [Int: Int] = [:]
    for i in 0..<n {
        if let value = dict[a[i]] {
            dict[a[i]] = value + 1
        } else {
            dict[a[i]] = 1
        }
        if i == 0 { continue }
        for j in 0..<i {
            let index = a[i] - a[j]
            if let value = dict[index] {
                dict[index] = value + 1
            } else {
                dict[index] = 1
            }
        }
    }

    var answer = 0
    for i in 0..<m {
        if let value = dict[t - b[i]] {
            answer += value
        }
        if i == 0 { continue }
        for j in 0..<i {
            if let value = dict[t - (b[i] - b[j])] {
                answer += value
            }
        }
    }
    print(answer)
}
