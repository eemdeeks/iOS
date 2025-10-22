//
//  7511.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 10/21/25.
//


func solution7511() {
    let fileIO = FileIO()

    let testCase = fileIO.readInt()
    var scenario: Int = 0
    while testCase > scenario {
        scenario += 1
        print("Scenario \(scenario):")
        let n = fileIO.readInt()
        let k = fileIO.readInt()

        var parents: [Int] = []
        var powers: [Int] = Array(repeating: 0, count: n)

        for i in 0..<n {
            parents.append(i)
        }

        for _ in 0..<k {
            let a = fileIO.readInt()
            let b = fileIO.readInt()

            union(a, b)
        }

        let m = fileIO.readInt()

        for _ in 0..<m {
            let u = fileIO.readInt()
            let v = fileIO.readInt()

            findParent(of: u) == findParent(of: v) ? print(1): print(0)
        }
        if testCase != scenario {
            print()
        }

        func findParent(of index: Int) -> Int {
            if parents[index] == index { return index }
            parents[index] = findParent(of: parents[index])

            return parents[index]
        }

        func union(_ left: Int, _ right: Int) {
            let leftParent = findParent(of: left)
            let rightParent = findParent(of: right)

            if powers[leftParent] == powers[rightParent] {
                powers[leftParent] += 1
                parents[rightParent] = leftParent
            } else if powers[leftParent] > powers[rightParent] {
                parents[rightParent] = leftParent
            } else {
                parents[leftParent] = rightParent
            }
        }
    }
}
