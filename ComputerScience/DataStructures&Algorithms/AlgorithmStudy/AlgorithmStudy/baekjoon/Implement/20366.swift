//
//  20366.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 1/14/26.
//


func solution20366() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    var snowBalls: [Int] = []

    for _ in 0..<n {
        snowBalls.append(fileIO.readInt())
    }

    var snowmans: [(x: Int, y: Int, height: Int)] = []

    for i in 0..<n {
        for j in i..<n where i != j {
            snowmans.append((i, j, snowBalls[i] + snowBalls[j]))
        }
    }

    snowmans.sort { $0.height < $1.height }

    var snowman = snowmans[0]
    var answer = Int.max
    for i in 1..<snowmans.count {
        if snowman.x != snowmans[i].x && snowman.x != snowmans[i].y && snowman.y != snowmans[i].x && snowman.y != snowmans[i].y {
            answer = min(answer, abs(snowmans[i].height - snowman.height))
            if answer == 0 { break }
        }
        snowman = snowmans[i]
    }

    print(answer)
}


