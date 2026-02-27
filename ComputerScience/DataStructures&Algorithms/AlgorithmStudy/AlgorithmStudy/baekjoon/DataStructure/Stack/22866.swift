//
//  22866.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/27/26.
//


func solution22866() {
    let n = Int(readLine()!)!
    let buildings: [Int] = readLine()!.split(separator:  " ").map { Int(String($0))! }

    var answers: [(index: Int, count: Int)] = Array(repeating: (Int.max, 0), count: n)

    var stack: [(index: Int, building: Int)] = []

    if buildings.count == 1 {
        print(0)
        return
    }

    for (index, building) in zip((1...buildings.count), buildings) {
        while let last = stack.popLast() {
            if last.building > building {
                stack.append(last)
                break
            }
        }

        answers[index - 1].count += stack.count
        if let last = stack.last {
            answers[index - 1].index = last.index
        }

        stack.append((index, building))
    }

    stack.removeAll()

    for (index, building) in zip((1...buildings.count), buildings).reversed() {
        while let last = stack.popLast() {
            if last.building > building {
                stack.append(last)
                break
            }
        }

        answers[index - 1].count += stack.count

        if let last = stack.last {
            let distanceLeft = abs(index - answers[index - 1].index)
            let distanceRight = abs(index - last.index)

            if distanceLeft > distanceRight {
                answers[index - 1].index = last.index
            }
        }

        stack.append((index, building))
    }

    print(
        answers
            .map {
                if $0.count == 0 {
                    "0"
                } else {
                    "\($0.count) \($0.index)"
                }
            }
            .joined(separator: "\n")
    )
}
