//
//  6987.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/6/26.
//


func solution6987() {
    let fileIO = FileIO()

    var answers: [String] = []

    var winCount: Int
    var drawCount: Int
    var loseCount: Int
    var resultGraph: [[Int]]

    for _ in 0..<4 {
        resultGraph = []

        for _ in 0..<6 {
            winCount = fileIO.readInt()
            drawCount = fileIO.readInt()
            loseCount = fileIO.readInt()

            resultGraph.append([winCount, drawCount, loseCount])
        }

        answers.append(game(0, 1) ? "1": "0")
    }

    print(answers.joined(separator: " "))

    func game(_ home: Int, _ away: Int) -> Bool {
        if home > 4 {
            return checkGraph()
        }
        if away > 5 {
            return game(home + 1, home + 2)
        }
        // 홈 승
        if resultGraph[home][0] >= 1 && resultGraph[away][2] >= 1 {
            resultGraph[home][0] -= 1
            resultGraph[away][2] -= 1
            if game(home, away + 1) { return true }
            resultGraph[home][0] += 1
            resultGraph[away][2] += 1
        }

        // 홈 무
        if resultGraph[home][1] >= 1 && resultGraph[away][1] >= 1 {
            resultGraph[home][1] -= 1
            resultGraph[away][1] -= 1
            if game(home, away + 1) { return true }
            resultGraph[home][1] += 1
            resultGraph[away][1] += 1
        }

        // 홈 패
        if resultGraph[home][2] >= 1 && resultGraph[away][0] >= 1 {
            resultGraph[home][2] -= 1
            resultGraph[away][0] -= 1
            if game(home, away + 1) { return true }
            resultGraph[home][2] += 1
            resultGraph[away][0] += 1
        }

        return false
    }

    func checkGraph() -> Bool {
        for i in resultGraph {
            if i.filter ({ $0 != 0 })
                .count > 0 {
                return false
            }
        }
        return true
    }
}
