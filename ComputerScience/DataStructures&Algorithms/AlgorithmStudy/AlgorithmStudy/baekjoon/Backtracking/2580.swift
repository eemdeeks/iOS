//
//  Area.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 10/24/25.
//


func solution2580() {
    var map: [[Int]] = []

    for _ in 0..<9 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }

        map.append(input)
    }

    typealias Index = (x: Int, y: Int)
    typealias Indexes = [Index]
    var emptyIndexes: Indexes = []

    for x in 0..<9 {
        for y in 0..<9 {
            if map[x][y] == 0 {
                emptyIndexes.append((x, y))
            }
        }
    }

    var answer: [[Int]] = []
    _ = track(0, map)
    print(answer
        .map { $0
            .map { String($0) }
            .joined(separator: " ")}
        .joined(separator: "\n"))

    func track(_ index: Int, _ map: [[Int]]) -> Bool {
        if index >= emptyIndexes.count {
            answer = map
            return true
        }
        let blank = emptyIndexes[index]
        for i in 1...9 {
            if canFilled(in: blank, i, map) {
                var newMap = map
                newMap[blank.x][blank.y] = i
                if track(index + 1, newMap) {
                    return true
                }
            }
        }

        return false
    }

    func canFilled(in blank: Index, _ number: Int, _ map: [[Int]]) -> Bool {
        if map[blank.x].contains(number) { return false }
        for x in 0..<9 {
            if map[x][blank.y] == number { return false }
        }

        let area = Area.area(of: blank)

        for x in area.xRange {
            for y in area.yRange {
                if map[x][y] == number { return false }
            }
        }

        return true
    }

    enum Area {
        static func area(of index: Index) -> (xRange: ClosedRange<Int>, yRange: ClosedRange<Int>) {
            switch index {
            case (0...2, 0...2):
                return (0...2, 0...2)
            case (0...2, 3...5):
                return (0...2, 3...5)
            case (0...2, 6...8):
                return (0...2, 6...8)
            case (3...5, 0...2):
                return (3...5, 0...2)
            case (3...5, 3...5):
                return (3...5, 3...5)
            case (3...5, 6...8):
                return (3...5, 6...8)
            case (6...8, 0...2):
                return (6...8, 0...2)
            case (6...8, 3...5):
                return (6...8, 3...5)
            case (6...8, 6...8):
                return (6...8, 6...8)
            default:
                return (6...8, 6...8)
            }
        }
    }
}
