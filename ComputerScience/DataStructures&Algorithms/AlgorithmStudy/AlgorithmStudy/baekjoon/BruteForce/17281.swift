//
//  17281.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 9/25/25.
//


func solution17281() {
    let fileIO = FileIO()
    let n = fileIO.readInt()
    var points: [[Int]] = []

    for _ in 0..<n {
        var point: [Int] = []
        for _ in 0..<9 {
            point.append(fileIO.readInt())
        }
        points.append(point)
    }

    var point = 0

    let visited = Array(repeating: false, count: 9)

    maxPoint(visited, [])

    print(point)

    func maxPoint(_ visited: [Bool], _ order: [Int]) {
        if order.count == 9 {
            point = max(point, getPoint(order))
            return
        }
        if order.count == 3 {
            var newVisited = visited
            newVisited[0] = true
            maxPoint(newVisited, order + [0])
        } else {
            for i in 1..<9 {
                if visited[i] { continue }
                var newVisited = visited
                newVisited[i] = true
                maxPoint(newVisited, order + [i])
            }
        }
    }

    func getPoint(_ order: [Int]) -> Int {
        var inning = 0
        var point = 0
        var orderIndex = 0

        var base1 = false
        var base2 = false
        var base3 = false

        var outCount = 0

        while inning < n {
            switch points[inning][order[orderIndex]] {
            case 0:
                outCount += 1
            case 1:
                if base3 {
                    point += 1
                    base3 = false
                }
                if base2 {
                    base3 = true
                    base2 = false
                }
                if base1 {
                    base2 = true
                }
                base1 = true
            case 2:
                if base3 {
                    point += 1
                    base3 = false
                }
                if base2 {
                    point += 1
                }
                if base1 {
                    base3 = true
                    base1 = false
                }
                base2 = true
            case 3:
                if base3 { point += 1 }
                if base2 {
                    point += 1
                    base2 = false
                }
                if base1 {
                    point += 1
                    base1 = false
                }
                base3 = true
            case 4:
                if base3 { point += 1 }
                if base2 { point += 1 }
                if base1 { point += 1}
                point += 1
                base3 = false
                base2 = false
                base1 = false
            default:
                break
            }

            if outCount == 3 {
                outCount = 0
                inning += 1
                base1 = false
                base2 = false
                base3 = false
            }
            orderIndex += 1
            orderIndex %= 9
        }

        return point
    }
}
