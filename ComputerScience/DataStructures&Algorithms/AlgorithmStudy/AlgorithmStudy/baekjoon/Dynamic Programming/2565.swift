//
//  2565.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/3/26.
//


func solution2565() {
    let fileIO = FileIO()
    let wireCount = fileIO.readInt()

    var wires: [(start: Int, end: Int)] = []
    var dp: [Int] = []

    for _ in 0..<wireCount {
        wires.append((fileIO.readInt(), fileIO.readInt()))
    }

    wires.sort { $0.start < $1.start }

    for wire in wires {
        if let last = dp.last {
            if last < wire.end {
                dp.append(wire.end)
                continue
            }

            for i in 0..<dp.count {
                if dp[i] >= wire.end {
                    dp[i] = wire.end
                    break
                }
            }
        } else {
            dp.append(wire.end)
        }
    }

    print(wireCount - dp.count)
}
