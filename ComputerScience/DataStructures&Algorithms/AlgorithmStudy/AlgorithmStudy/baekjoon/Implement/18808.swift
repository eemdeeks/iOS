//
//  18808.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 1/29/26.
//

// 구현, 완탐, 시뮬레이션
func solution18808() {
    let fileIO = FileIO()

    let n = fileIO.readInt()    // 노트북 세로의 길이
    let m = fileIO.readInt()    // 노트북 가로의 길이
    let k = fileIO.readInt()    // 스티커의 개수


    var notebook: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    var stickers: [[[Int]]] = []
    var r: Int  // 모눈종이 행의 개수
    var c: Int  // 모눈종이 열의 개수
    var sticker: [[Int]]
    var row: [Int]

    for _ in 0..<k {
        sticker = []
        r = fileIO.readInt()
        c = fileIO.readInt()
        for _ in 0..<r {
            row = []
            for _ in 0..<c {
                row.append(fileIO.readInt())
            }
            sticker.append(row)
        }
        stickers.append(sticker)
    }

    var rotatedSticker: [[Int]]

    for sticker in stickers {
        rotatedSticker = sticker
        for _ in 0..<4 {
            if canAttach(rotatedSticker) { break }

            rotatedSticker = rotatedSticker90(rotatedSticker)
        }
    }

    var answer = 0

    for x in 0..<n {
        for y in 0..<m {
            if notebook[x][y] { answer += 1 }
        }
    }

    print(answer)

    func canAttach(_ sticker: [[Int]]) -> Bool {
        for x in 0..<n where sticker.count + x <= n {
            for y in 0..<m where sticker[0].count + y <= m {
                if canAttach(sticker, to: (x, y)) {
                    attach(sticker, to: (x, y))
                    return true
                }
            }
        }

        return false
    }

    func canAttach(_ sticker: [[Int]], to position: (x: Int, y: Int)) -> Bool {
        for rowIndex in 0..<sticker.count {
            for colIndex in 0..<sticker[0].count {
                if notebook[rowIndex + position.x][colIndex + position.y] && sticker[rowIndex][colIndex] == 1 {
                    return false
                }
            }
        }

        return true
    }

    func attach(_ sticker: [[Int]], to position: (x: Int, y: Int)) {
        for rowIndex in 0..<sticker.count {
            for colIndex in 0..<sticker[0].count {
                if sticker[rowIndex][colIndex] == 1 {
                    notebook[rowIndex + position.x][colIndex + position.y] = true
                }
            }
        }
    }

    func rotatedSticker90(_ sticker: [[Int]]) -> [[Int]] {
        let rowCount = sticker.count
        let colCount = sticker[0].count

        var rotatedSticker: [[Int]] = Array(repeating: Array(repeating: 0, count: rowCount), count: colCount)

        for row in 0..<rowCount {
            for col in 0..<colCount {
                rotatedSticker[col][rowCount - 1 - row] = sticker[row][col]
            }
        }

        return rotatedSticker
    }

}
