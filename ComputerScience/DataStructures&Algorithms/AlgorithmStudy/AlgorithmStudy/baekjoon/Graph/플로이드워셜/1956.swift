//
//  1956.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/4/26.
//


func solution1956() {
    let fileIO = FileIO()

    let v = fileIO.readInt()
    let e = fileIO.readInt()

    var edges: [[Int]] = Array(repeating: Array(repeating: -1, count: v), count: v)

    for _ in 0..<e {
        edges[fileIO.readInt() - 1][fileIO.readInt() - 1] = fileIO.readInt()
    }

    for i in 0..<v {
        for x in 0..<v where i != x && edges[x][i] != -1 {
            for y in 0..<v where x != y && edges[i][y] != -1 {
                edges[x][y] = edges[x][y] == -1 ? edges[x][i] + edges[i][y]: min(edges[x][y], edges[x][i] + edges[i][y])
            }
        }
    }

    var answer = -1

    for x in 0..<v {
        for y in 0..<v where x != y && edges[x][y] != -1 && edges[y][x] != -1 {
            answer = answer == -1 ? edges[x][y] + edges[y][x]: min(answer, edges[x][y] + edges[y][x])
        }
    }

    print(answer)
}
