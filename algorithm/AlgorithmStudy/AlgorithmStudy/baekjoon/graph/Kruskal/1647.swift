//
//  1647.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/2/25.
//

func solution1647() {
    let fileIO = FileIO()
    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var edges: [[Int]] = []

    for _ in 0..<m {
        edges.append([fileIO.readInt(), fileIO.readInt(), fileIO.readInt()])
    }

    var parents: [Int] = []
    var power: [Int] = []
    var answerEdges: [Int] = []

    for i in 0...n {
        parents.append(i)
        power.append(0)
    }

    edges.sort { $0[2] < $1[2] }

    for edge in edges {
        if answerEdges.count == n - 1 { break }
        if parent(of: edge[0]) == parent(of: edge[1]) { continue }
        answerEdges.append(edge[2])
        union(edge[0], edge[1])
    }

    answerEdges.removeLast()

    print(answerEdges.reduce(0, +))

    func parent(of index: Int) -> Int {
        if parents[index] == index { return index }
        else { return parent(of: parents[index]) }
    }

    func union(_ leftIndex: Int, _ rightIndex: Int) {
        let leftParent = parent(of: leftIndex)
        let rightParent = parent(of: rightIndex)

        if power[leftParent] == power[rightParent] {
            parents[rightParent] = leftParent
            power[leftParent] += 1
        } else if power[leftParent] > power[rightParent] {
            parents[rightParent] = leftParent
        } else {
            parents[leftParent] = rightParent
        }
    }
}
