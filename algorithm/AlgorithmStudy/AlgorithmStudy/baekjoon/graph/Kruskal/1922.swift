//
//  1922.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/20/25.
//

func solution1922() {
    let computerCount: Int = Int(readLine()!)!
    let edgeCount: Int = Int(readLine()!)!
    var edges: [[Int]] = []

    for _ in 0..<edgeCount {
        edges.append(readLine()!.split(separator: " ").map{ Int($0)! })
    }

    var edgeParent: [Int] = []
    var edgePower: [Int] = []
    for i in 0...computerCount {
        edgeParent.append(i)
        edgePower.append(0)
    }

    var answerEdges: [Int] = []
    edges.sort {
        $0[2] < $1[2]
    }

    for edge in edges {
        if findParent(edge[0]) == findParent(edge[1]) {
            continue
        }
        answerEdges.append(edge[2])
        unionNode(edge[0],edge[1])
    }

    func findParent(_ index: Int) -> Int {
        if edgeParent[index] == index { return index }
        else { return findParent(edgeParent[index]) }
    }

    func unionNode(_ left: Int, _ right: Int) {
        let leftParent = findParent(left)
        let rightParent = findParent(right)

        if edgePower[leftParent] == edgePower[rightParent] {
            edgeParent[rightParent] = edgeParent[leftParent]
            edgePower[leftParent] += 1
        } else if edgePower[leftParent] > edgePower[rightParent] {
            edgeParent[rightParent] = edgeParent[leftParent]
        } else {
            edgeParent[leftParent] = edgeParent[rightParent]
        }
    }

    print(answerEdges.reduce(0,+))

}
