//
//  16724.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/14/25.
//

func solution16724() {
    let fileIO = FileIO()

    let rowCount = fileIO.readInt()
    let colCount = fileIO.readInt()

    var graph: [[String]] = []
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: colCount), count: rowCount)
    var parents: [[(row: Int, col: Int)]] = []
    var powers: [[Int]] = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)

    for rowIndex in 0..<rowCount {
        let row: [String] = fileIO.readString().map { String($0) }
        var parentIndex: [(Int, Int)] = []
        for colIndex in 0..<colCount {
            parentIndex.append((rowIndex, colIndex))
        }
        graph.append(row)
        parents.append(parentIndex)
    }

    for rowIndex in 0..<rowCount {
        for colIndex in 0..<colCount {
            if visited[rowIndex][colIndex] { continue }
            var stack: [(row: Int, col: Int)] = [(rowIndex, colIndex)]

            while !stack.isEmpty {
                let index = stack.removeLast()

                visited[index.row][index.col] = true

                let newIndex: (row: Int, col: Int)

                switch graph[index.row][index.col] {
                case "U":
                    newIndex = (index.row - 1, index.col)
                case "D":
                    newIndex = (index.row + 1, index.col)
                case "L":
                    newIndex = (index.row, index.col - 1)
                case "R":
                    newIndex = (index.row, index.col + 1)
                default:
                    continue
                }

                if newIndex.row < 0 || newIndex.row >= rowCount || newIndex.col < 0 || newIndex.col >= colCount {
                    continue
                }

                union(index, newIndex)

                if !visited[newIndex.row][newIndex.col] {
                    stack.append(newIndex)
                }
            }
        }
    }

    var answers: Set<[Int]> = []
    for rowIndex in 0..<rowCount {
        for colIndex in 0..<colCount {
            let parent = findParent((rowIndex, colIndex))
            if !answers.contains([parent.row, parent.col]) {
                answers.insert([parent.row, parent.col])
            }
        }
    }


    print(answers.count)

    func union(_ left: (row: Int, col: Int), _ right: (row: Int, col: Int)) {
        let leftParent = findParent(left)
        let rightParent = findParent(right)

        if powers[leftParent.row][leftParent.col] == powers[rightParent.row][rightParent.col] {
            parents[rightParent.row][rightParent.col] = leftParent
            powers[leftParent.row][leftParent.col] += 1
        } else if powers[leftParent.row][leftParent.col] > powers[rightParent.row][rightParent.col] {
            parents[rightParent.row][rightParent.col] = leftParent
        } else {
            parents[leftParent.row][leftParent.col] = rightParent
        }
    }

    func findParent(_ index: (row: Int, col: Int)) -> (row: Int, col: Int) {
        if parents[index.row][index.col] == index { return index }
        else {
            parents[index.row][index.col] = findParent(parents[index.row][index.col])
            return parents[index.row][index.col]
        }
    }
}
