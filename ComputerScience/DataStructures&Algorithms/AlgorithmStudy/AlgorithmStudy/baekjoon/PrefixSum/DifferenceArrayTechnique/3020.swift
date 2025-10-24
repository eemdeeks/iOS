//
//  3020.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 10/23/25.
//


func solution3020() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let h = fileIO.readInt()

    var diffArray = Array(repeating: 0, count: h + 1)

    var isEven = true
    for _ in 0..<n {
        let value = fileIO.readInt()
        if isEven {
            diffArray[0] += 1
            diffArray[value] -= 1
        } else {
            diffArray[h - value] += 1
        }

        isEven.toggle()
    }

    var prefix = 0

    diffArray.removeLast()
    var minValue = Int.max
    var minCount = 0

    for i in diffArray {
        prefix += i

        if minValue > prefix {
            minValue = prefix
            minCount = 1
        } else if minValue == prefix {
            minCount += 1
        }
    }

    print("\(minValue) \(minCount)")
}

