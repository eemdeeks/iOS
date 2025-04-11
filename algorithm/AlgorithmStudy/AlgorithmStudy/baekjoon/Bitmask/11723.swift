//
//  11723.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/10/25.
//


func solution11723() {
    let fileIO = FileIOFast()
    let m = fileIO.readInt()
    var s = 0
    var answer: [String] = []

    for _ in 0..<m {
        switch fileIO.readStringSum() {
        case 297: s |= 1 << fileIO.readInt()
            case 654: s &= ~(1 << fileIO.readInt())
            case 510: s | 1 << fileIO.readInt() == s ? answer.append("1") : answer.append("0")
            case 642: s ^= (1 << fileIO.readInt())
            case 313: s |= ~0
            case 559: s &= 0
            default: break
        }
    }
    print(answer.joined(separator: "\n"))
}
