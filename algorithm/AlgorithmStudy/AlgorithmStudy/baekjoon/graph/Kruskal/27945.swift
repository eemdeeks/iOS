//
//  27945.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 8/28/25.
//


func solution27945() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var loads: [[Int]] = []
    for _ in 0..<m {
        loads.append([fileIO.readInt(), fileIO.readInt(), fileIO.readInt()])
    }
    loads.sort { $0[2] < $1[2] }

    var parents: [Int] = []
    var powers: [Int] = []

    for i in 0...n {
        parents.append(i)
        powers.append(0)
    }

    var day = 1
    var usingLoad: [Int] = []
    for load in loads {
        let leftParent = findParent(load[0])
        let rightParent = findParent(load[1])

        if leftParent == rightParent { continue }

        if day != load[2] { break }

        usingLoad.append(load[2])
        union(load[0], load[1])
        day += 1

        if usingLoad.count == n - 1 {
            break
        }
    }

    print(day)

    func findParent(_ index: Int) -> Int {
        if parents[index] == index { return index }
        parents[index] = findParent(parents[index])
        return parents[index]
    }

    func union(_ left: Int, _ right: Int) {
        let leftParent = findParent(left)
        let rightParent = findParent(right)

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
