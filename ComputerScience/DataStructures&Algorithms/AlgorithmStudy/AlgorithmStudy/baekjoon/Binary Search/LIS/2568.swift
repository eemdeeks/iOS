//
//  2568.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/8/25.
//


func solution2568() {
    let fileIO = FileIO()

    let wireCount = fileIO.readInt()

    var wires: [(a: Int, b: Int)] = []

    for _ in 0..<wireCount {
        wires.append((fileIO.readInt(), fileIO.readInt()))
    }

    wires.sort { $0.a < $1.a }

    var dp: [Int] = []
    var locate: [Int] = []

    for wire in wires {
        guard let last = dp.last else {
            dp.append(wire.b)
            locate.append(0)
            continue
        }

        if last < wire.b {
            dp.append(wire.b)
            locate.append(dp.count - 1)
        } else {
            var start = 0
            var end = dp.count - 1

            while start < end - 1 {
                let mid = (start + end) / 2

                if dp[mid] > wire.b {
                    end = mid
                } else {
                    start = mid
                }
            }

            if dp[start] < wire.b {
                dp[end] = wire.b
                locate.append(end)
            } else {
                dp[start] = wire.b
                locate.append(start)
            }
        }
    }

    print(wireCount - dp.count)
    var index = dp.count - 1

    var answerIndex: Set<Int> = []
    for i in (0..<wireCount).reversed() {
        if locate[i] == index {
            answerIndex.insert(i)
            index -= 1
        }
        if index < 0 { break }
    }

    var answer: [String] = []
    for i in 0..<wireCount {
        if !answerIndex.contains(i) {
            answer.append(String(wires[i].a))
        }
    }

    print(answer.joined(separator: "\n"))
}
