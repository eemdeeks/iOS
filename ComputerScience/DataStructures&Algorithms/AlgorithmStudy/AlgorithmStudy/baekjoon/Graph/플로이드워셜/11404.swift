//
//  11404.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/21/25.
//


func solution11404() {
    let fileIO = FileIO()
    let n = fileIO.readInt()    // 도시의 개수
    let m = fileIO.readInt()    // 버스의 개수
    var busses: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
    var a: Int
    var b: Int
    var value: Int
    for _ in 0..<m {
        a = fileIO.readInt()
        b = fileIO.readInt()
        value = fileIO.readInt()
        busses[a][b] = busses[a][b] == 0 ? value: min(busses[a][b], value)
    }

    for i in 1...n {
        for x in 1...n {
            if i == x { continue }
            if busses[x][i] == 0 { continue }
            for y in 1...n {
                if x == y { continue }
                if busses[i][y] == 0 { continue }
                busses[x][y] = busses[x][y] == 0 ? busses[x][i] + busses[i][y]: min(busses[x][y], busses[x][i] + busses[i][y])
            }
        }
    }

    for x in 1...n {
        for y in 1...n {
            print(busses[x][y], terminator: " ")
        }
        print()
    }
}
