//
//  1717.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 8/27/25.
//


func solution1717() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var parents: [Int] = []
    var powers: [Int] = Array(repeating: 0, count: n + 1)

    var answer: [String] = []

    for i in 0...n {
        parents.append(i)
    }

    for _ in 0..<m {
        let doUnion = fileIO.readInt()
        let first = fileIO.readInt()
        let second = fileIO.readInt()

        if doUnion == 0 {
            union(first, second)
        } else {
            if findParent(first) == findParent(second) {
                answer.append("YES")
            } else {
                answer.append("NO")
            }
        }
    }

    print(answer.joined(separator: "\n"))

    func findParent(_ element: Int) -> Int {
        if element == parents[element] { return element }
        parents[element] = findParent(parents[element])
        return parents[element]
    }

    func union(_ first: Int, _ second: Int) {
        let firstParent = findParent(first)
        let secondParent = findParent(second)
        
        if firstParent == secondParent { return }

        if powers[firstParent] == powers[secondParent] {
            powers[firstParent] += 1
            parents[secondParent] = firstParent
        } else if powers[firstParent] > powers[secondParent] {
            parents[secondParent] = firstParent
        } else {
            parents[firstParent] = secondParent
        }
    }
}
