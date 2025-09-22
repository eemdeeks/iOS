//
//  12100.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/21/25.
//

// 완전탐색
func solution12100() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    let initMap: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var graph: [[Int]] = initMap

    for x in 0..<n {
        for y in 0..<n {
            graph[x][y] = fileIO.readInt()
        }
    }

    var stack: [(count: Int, map: [[Int]])] = [(0, graph)]

    var answer: Int = 0
    while !stack.isEmpty {
        let map = stack.removeLast()

        if map.count == 5 {
            answer = max(map.map.map { $0.max()! }.max()!, answer)
            continue
        }

        // 상
        var newMap = initMap
        for y in 0..<n {
            var after: [Int] = []
            var value = 0
            for x in 0..<n {
                switch map.map[x][y] {
                case 0:
                    continue
                case value:
                    after.append(value * 2)
                    value = 0
                default:
                    if value != 0 { after.append(value) }
                    value = map.map[x][y]
                }
            }
            if value != 0 { after.append(value)}

            for x in 0..<after.count {
                newMap[x][y] = after[x]
            }
        }

        stack.append((map.count + 1, newMap))

        // 하
        newMap = initMap
        for y in 0..<n {
            var after: [Int] = []
            var value = 0
            for x in (0..<n).reversed() {
                switch map.map[x][y] {
                case 0:
                    continue
                case value:
                    after.append(value * 2)
                    value = 0
                default:
                    if value != 0 { after.append(value) }
                    value = map.map[x][y]
                }
            }
            if value != 0 { after.append(value)}

            for x in 0..<after.count {
                newMap[n - x - 1][y] = after[x]
            }
        }

        stack.append((map.count + 1, newMap))

        // 좌
        newMap = initMap
        for x in 0..<n {
            var after: [Int] = []
            var value = 0
            for y in 0..<n {
                switch map.map[x][y] {
                case 0:
                    continue
                case value:
                    after.append(value * 2)
                    value = 0
                default:
                    if value != 0 { after.append(value) }
                    value = map.map[x][y]
                }
            }
            if value != 0 { after.append(value)}

            for y in 0..<after.count {
                newMap[x][y] = after[y]
            }
        }

        stack.append((map.count + 1, newMap))

        // 우
        newMap = initMap
        for x in 0..<n {
            var after: [Int] = []
            var value = 0
            for y in (0..<n).reversed() {
                switch map.map[x][y] {
                case 0:
                    continue
                case value:
                    after.append(value * 2)
                    value = 0
                default:
                    if value != 0 { after.append(value) }
                    value = map.map[x][y]
                }
            }
            if value != 0 { after.append(value)}

            for y in 0..<after.count {
                newMap[x][n - y - 1] = after[y]
            }
        }

        stack.append((map.count + 1, newMap))
    }

    print(answer)
}
