//
//  15683.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/28/25.
//

func solution15683() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let maxX: Int = input[0]
    let maxY: Int = input[1]

    var map: [[Int]] = []
    for _ in 0..<maxX {
        map.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    var cctv: [(Int, Int, Int)] = []
    for x in 0..<maxX {
        for y in 0..<maxY {
            if (1...5).contains(map[x][y]) {
                cctv.append((map[x][y], x, y))
            }
        }
    }

    print(observe(map: map, stack: cctv))
    func observe(map: [[Int]], stack: [(Int, Int, Int)]) -> Int {
        if stack.isEmpty {
            return map.reduce(0) {
                $0 + $1.reduce(0) {
                    $0 + ($1 == 0 ? 1: 0)
                }
            }
        }
        var newStack = stack
        var newMap = map
        let cctv = newStack.removeLast()
        switch cctv.0 {
        case 1:
            return min(
                observe(
                    map: detectLeft(map: newMap, position: (cctv.1, cctv.2)),
                    stack: newStack),
                observe(
                    map: detectRight(map: newMap, position: (cctv.1, cctv.2)),
                    stack: newStack),
                observe(
                    map: detectUp(map: newMap, position: (cctv.1, cctv.2)),
                    stack: newStack),
                observe(
                    map: detectDown(map: newMap, position: (cctv.1, cctv.2)),
                    stack: newStack))
        case 2:
            return min(
                observe(
                    map: detectRight(
                        map: detectLeft(
                            map: newMap,
                            position: (cctv.1, cctv.2)),
                        position: (cctv.1, cctv.2)),
                    stack: newStack),
                observe(
                    map: detectDown(
                        map: detectUp(
                            map: newMap,
                            position: (cctv.1, cctv.2)
                        ),
                        position: (cctv.1, cctv.2)
                    ),
                    stack: newStack
                )
            )
        case 3:
            return min(
                observe(
                    map: detectRight(
                        map: detectUp(
                            map: newMap,
                            position: (cctv.1, cctv.2)),
                        position: (cctv.1, cctv.2)),
                    stack: newStack),
                observe(
                    map: detectDown(
                        map: detectRight(
                            map: newMap,
                            position: (cctv.1, cctv.2)),
                        position: (cctv.1, cctv.2)),
                    stack: newStack),
                observe(
                    map: detectLeft(
                        map: detectDown(
                            map: newMap,
                            position: (cctv.1, cctv.2)),
                        position: (cctv.1, cctv.2)),
                    stack: newStack),
                observe(
                    map: detectUp(
                        map: detectLeft(
                            map: newMap,
                            position: (cctv.1, cctv.2)),
                        position: (cctv.1, cctv.2)),
                    stack: newStack))
        case 4:
            return min(
                observe(
                    map: detectUp(
                        map: detectLeft(
                            map: detectRight(
                                map: newMap,
                                position: (cctv.1, cctv.2)),
                            position: (cctv.1, cctv.2)),
                        position: (cctv.1, cctv.2)),
                    stack: newStack),
                observe(
                    map: detectRight(
                        map: detectUp(
                            map: detectDown(
                                map: newMap,
                                position: (cctv.1, cctv.2)),
                            position: (cctv.1, cctv.2)),
                        position: (cctv.1, cctv.2)),
                    stack: newStack),
                observe(
                    map: detectDown(
                        map: detectRight(
                            map: detectLeft(
                                map: newMap,
                                position: (cctv.1, cctv.2)),
                            position: (cctv.1, cctv.2)),
                        position: (cctv.1, cctv.2)),
                    stack: newStack),
                observe(
                    map: detectLeft(
                        map: detectDown(
                            map: detectUp(
                                map: newMap,
                                position: (cctv.1, cctv.2)),
                            position: (cctv.1, cctv.2)),
                        position: (cctv.1, cctv.2)),
                    stack: newStack))
        case 5:
            return observe(
                map: detectRight(
                    map: detectUp(
                        map: detectLeft(
                            map: detectDown(
                                map: newMap,
                                position: (cctv.1, cctv.2)),
                            position: (cctv.1, cctv.2)),
                        position: (cctv.1, cctv.2)),
                    position: (cctv.1, cctv.2)),
                stack: newStack)
        default:
            return -1
        }
    }

    func detectLeft(map: [[Int]], position: (Int, Int)) -> [[Int]] {
        var newMap = map
        for i in (0..<position.1).reversed() {
            if newMap[position.0][i] == 6 {
                return newMap
            } else if newMap[position.0][i] == 0 {
                newMap[position.0][i] = -1
            }
        }
        return newMap
    }

    func detectRight(map: [[Int]], position: (Int, Int)) -> [[Int]] {
        var newMap = map
        for i in position.1..<maxY {
            if newMap[position.0][i] == 6 {
                return newMap
            } else if newMap[position.0][i] == 0 {
                newMap[position.0][i] = -1
            }
        }
        return newMap
    }

    func detectUp(map: [[Int]], position: (Int, Int)) -> [[Int]] {
        var newMap = map
        for i in (0..<position.0).reversed() {
            if newMap[i][position.1] == 6 {
                return newMap
            } else if newMap[i][position.1] == 0 {
                newMap[i][position.1] = -1
            }
        }
        return newMap
    }

    func detectDown(map: [[Int]], position: (Int, Int)) -> [[Int]] {
        var newMap = map
        for i in position.0..<maxX {
            if newMap[i][position.1] == 6 {
                return newMap
            } else if newMap[i][position.1] == 0 {
                newMap[i][position.1] = -1
            }
        }
        return newMap
    }
}
