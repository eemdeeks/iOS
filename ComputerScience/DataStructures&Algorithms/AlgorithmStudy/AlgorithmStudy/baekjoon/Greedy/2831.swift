//
//  2831.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 1/13/26.
//

func solution2831() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var positiveMan: [Int] = []
    var negativeMan: [Int] = []
    var positiveWoman: [Int] = []
    var negativeWoman: [Int] = []

    for _ in 0..<n {
        let height = fileIO.readInt()

        if height < 0 {
            negativeMan.append(height)
        } else {
            positiveMan.append(height)
        }
    }

    for _ in 0..<n {
        let height = fileIO.readInt()

        if height < 0 {
            negativeWoman.append(height)
        } else {
            positiveWoman.append(height)
        }
    }

    positiveMan.sort()
    positiveWoman.sort()
    negativeMan.sort(by: >)
    negativeWoman.sort(by: >)

    var answer: Int = 0

    var manIndex = 0
    var womanIndex = 0

    while manIndex < positiveMan.count && womanIndex < negativeWoman.count {
        if positiveMan[manIndex] + negativeWoman[womanIndex] < 0 {
            answer += 1
            manIndex += 1
            womanIndex += 1
        } else {
            womanIndex += 1
        }
    }

    manIndex = 0
    womanIndex = 0

    while manIndex < negativeMan.count && womanIndex < positiveWoman.count {
        if negativeMan[manIndex] + positiveWoman[womanIndex] < 0 {
            answer += 1
            manIndex += 1
            womanIndex += 1
        } else {
            manIndex += 1
        }
    }

    print(answer)
}
