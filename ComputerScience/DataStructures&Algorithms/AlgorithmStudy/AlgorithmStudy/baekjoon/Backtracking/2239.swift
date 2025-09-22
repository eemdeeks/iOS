//
//  2239.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/22/25.
//

func solution2239() {
    var graph: [[Int]] = []

    for _ in 0..<9 {
        let row = readLine()!.map { Int(String($0))! }
        graph.append(row)
    }

    var emptyIndex: [(x: Int, y: Int)] = []

    for x in 0..<9 {
        for y in 0..<9 {
            if graph[x][y] == 0 { emptyIndex.append((x, y)) }
        }
    }

    guard let answer = sudo(0, graph: graph).1 else { return }
    print(answer
        .map { $0.map { String($0) }.joined()}
        .joined(separator: "\n"))

    // 스도쿠 풀기
    func sudo(_ num: Int, graph: [[Int]]) -> (Bool, [[Int]]?) {
        if num >= emptyIndex.count { return (true, graph) }

        let index = emptyIndex[num]
        for i in 1...9 {
            if check(i, index: index, graph: graph) {
                var newGraph = graph
                newGraph[index.x][index.y] = i
                let answer = sudo(num + 1, graph: newGraph)
                if answer.0 { return answer }
            }
        }

        return (false, nil)
    }

    // num을 index에 넣었을 경우 스도쿠가 가능한지
    func check(_ num: Int, index: (x: Int, y: Int), graph: [[Int]]) -> Bool {
        for x in 0..<9 {
            if graph[x][index.y] == num { return false }
        }

        for y in 0..<9 {
            if graph[index.x][y] == num { return false }
        }
        var startX: Int = 0
        var endX: Int = 0
        switch index.x {
        case 0...2:
            startX = 0
            endX = 2
        case 3...5:
            startX = 3
            endX = 5
        case 6...8:
            startX = 6
            endX = 8
        default:
            return false
        }

        var startY: Int = 0
        var endY: Int = 0
        switch index.y {
        case 0...2:
            startY = 0
            endY = 2
        case 3...5:
            startY = 3
            endY = 5
        case 6...8:
            startY = 6
            endY = 8
        default:
            return false
        }

        for x in startX...endX {
            for y in startY...endY {
                if graph[x][y] == num { return false }
            }
        }

        return true
    }
}
