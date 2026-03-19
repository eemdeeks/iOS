//
//  2437.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/19/26.
//


func solution2437() {
    let _ = Int(readLine()!)!

    var numbers: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

    numbers.sort()

    var canMaxNumber = 0

    for i in numbers {
        if canMaxNumber + 1 >= i {
            canMaxNumber += i
        } else {
            break
        }
    }

    print(canMaxNumber + 1)

}