//
//  Position.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/5/25.
//

import Foundation

// 최소스패닝트리

/*
 1. 크루스칼 알고리즘을 이용하기 위해서, 모든 별들간의 거리를 구한다.
 2. 별들간의 거리를 오름차순으로 정렬 후 크루스칼 알고리즘 이용
 크루스칼 알고리즘 -> 낮은비용의 간선부터 연결하는데, 순환을 허용하지 않게 하기 위해 union-find 알고리즘 사용
 */
func solution4386() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var stars: [Position] = []

    var parents: [Int] = []
    var powers: [Int] = Array(repeating: 0, count: n)
    var edges: [(start: Int, end: Int, distance: Double)] = []
    var answer: Double = 0

    for i in 0..<n {
        parents.append(i)
        guard
            let xPosition = Double(fileIO.readString()),
            let yPosition = Double(fileIO.readString())
        else {
            continue
        }
        stars.append(Position(x: xPosition, y: yPosition))
    }

    for i in 0..<n {
        for j in i..<n where i != j {
            edges.append((i, j, stars[i].distance(of: stars[j])))
        }
    }

    edges.sort { $0.distance < $1.distance }

    for edge in edges {
        if findParent(of: edge.start) != findParent(of: edge.end) {
            answer += edge.distance
            union(edge.start, edge.end)
        }
    }

    print(round(answer * 100) / 100)

    func findParent(of index: Int) -> Int {
        if parents[index] == index {
            return index
        }
        parents[index] = findParent(of: parents[index])

        return parents[index]
    }

    func union(_ left: Int, _ right: Int) {
        let leftParent = findParent(of: left)
        let rightParent = findParent(of: right)

        if powers[leftParent] == powers[rightParent] {
            parents[rightParent] = leftParent
            powers[leftParent] += 1
        } else if powers[leftParent] > powers[rightParent] {
            parents[rightParent] = leftParent
        } else {
            parents[leftParent] = rightParent
        }
    }

    struct Position {
        let x: Double
        let y: Double

        func distance(of position: Position) -> Double {
            let diffX = position.x - x
            let diffY = position.y - y

            return sqrt(diffX * diffX + diffY * diffY)
        }
    }
}
