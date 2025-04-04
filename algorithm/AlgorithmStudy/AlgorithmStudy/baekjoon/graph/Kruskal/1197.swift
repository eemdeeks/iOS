//
//  1197.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/3/25.
//

func solution1197() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let v = input[0] // 정점의 개수
    let e = input[1] // 간선의 개수
    var edges: [[Int]] = [] // [정점, 정점, 가중치]
    var answerEdges: [Int] = [] // 정답 간선의 가중치 배열

    var nodesPower: [Int] = []
    var nodesParent: [Int] = []

    for _ in 0..<e {
        edges.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    edges.sort{ $0[2] < $1[2] }

    for i in 0...v {
        nodesPower.append(0)
        nodesParent.append(i)
    }

    for edge in edges {
        if answerEdges.count >= v-1 {
            break
        }
        if findParent(edge[0]) != findParent(edge[1]) {
            answerEdges.append(edge[2])
            union(edge[0], edge[1])
        }

    }

    print(answerEdges.reduce(0, +))

    func findParent(_ node: Int) -> Int {
        let parent = nodesParent[node]
        if parent == node {
            return node
        }
        return findParent(parent)
    }

    func union(_ leftNode: Int, _ rightNode: Int) {
        let leftParent = findParent(leftNode)
        let rightParent = findParent(rightNode)
        
        if nodesPower[leftParent] == nodesPower[rightParent] {
            nodesParent[rightParent] = leftParent
            nodesPower[leftParent] += 1
        } else if nodesPower[leftParent] > nodesPower[rightParent] {
            nodesParent[rightParent] = leftParent
        } else {
            nodesParent[leftParent] = rightParent
        }
    }

}
