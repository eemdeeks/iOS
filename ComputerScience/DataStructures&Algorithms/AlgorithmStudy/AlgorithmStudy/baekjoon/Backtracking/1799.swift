//
//  1799.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 8/26/25.
//

// 백트래킹
func solution1799() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var blackIndex: [(x: Int, y: Int)] = []
    var whiteIndex: [(x: Int, y: Int)] = []

    for x in 0..<n {
        for y in 0..<n {
            if fileIO.readInt() == 1 {
                if (x + y) % 2 == 0 {
                    blackIndex.append((x, y))
                } else {
                    whiteIndex.append((x, y))
                }
            }
        }
    }

    var blackBishop = 0
    var whiteBishop = 0

    var rowVisited: [Bool] = Array(repeating: false, count: n * 2 - 1)
    var colVisited: [Bool] = Array(repeating: false, count: n * 2 - 1)
    tracking(0, 0, &rowVisited, &colVisited, false)
    tracking(0, 0, &rowVisited, &colVisited, true)

    print(blackBishop + whiteBishop)

    func tracking(_ number: Int, _ bishopsCount: Int, _ rowVisited: inout [Bool], _ colVisited: inout [Bool], _ isBlack: Bool) {
        if isBlack {
            if blackIndex.count == number {
                blackBishop = max(blackBishop, bishopsCount)
                return
            }
        } else {
            if whiteIndex.count == number {
                whiteBishop = max(whiteBishop, bishopsCount)
                return
            }
        }

        let newIndex = isBlack ? blackIndex[number]: whiteIndex[number]

        if !rowVisited[newIndex.x + newIndex.y] && !colVisited[newIndex.x - newIndex.y + n - 1] {
            rowVisited[newIndex.x + newIndex.y] = true
            colVisited[newIndex.x - newIndex.y + n - 1] = true
            tracking(number + 1, bishopsCount + 1, &rowVisited, &colVisited, isBlack)
            rowVisited[newIndex.x + newIndex.y] = false
            colVisited[newIndex.x - newIndex.y + n - 1] = false
        }

        tracking(number + 1, bishopsCount, &rowVisited, &colVisited, isBlack)

        return
    }
}
