//
//  10026.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/07/08.
//

import Foundation

func solution10026() {
    let n: Int = Int(readLine()!)!
    
    var drawing: [[Character]] = []
    
    for _ in 0..<n {
        drawing.append(Array(readLine()!))
    }
    
    print(dfs10026(drawing, n: n),terminator: " ")
    for i in 0..<n {
        for j in 0..<n {
            if drawing[i][j] == "G"{
                drawing[i][j] = "R"
            }
        }
    }
    print(dfs10026(drawing, n: n))
}

func dfs10026(_ drawing: [[Character]], n: Int) -> Int {
    var graph: [[Bool]] = Array(repeating: [Bool](repeating: false, count: n), count: n)

    var node: [Int] = [0,0]
    var neededIndex: [[Int]] = []
    var answer: Int = 0
    var comp: Character = "r"


    for i in 0..<n {
        for j in 0..<n {
            if !graph[i][j] {
                neededIndex.append([i,j])
                answer += 1
                comp = drawing[i][j]
                while !neededIndex.isEmpty {
                    node = neededIndex.removeLast()
                    graph[node[0]][node[1]] = true
                    if node[0] - 1 >= 0, !graph[node[0]-1][node[1]], comp == drawing[node[0]-1][node[1]]{
                        neededIndex += [[node[0]-1,node[1]]]
                    }
                    if node[1] - 1 >= 0, !graph[node[0]][node[1]-1], comp == drawing[node[0]][node[1]-1]{
                        neededIndex += [[node[0],node[1]-1]]
                    }
                    if node[0] + 1 < n, !graph[node[0]+1][node[1]], comp == drawing[node[0]+1][node[1]]{
                        neededIndex += [[node[0]+1,node[1]]]
                    }
                    if node[1] + 1 < n, !graph[node[0]][node[1]+1], comp == drawing[node[0]][node[1]+1]{
                        neededIndex += [[node[0],node[1]+1]]
                    }
                }

            }
        }
    }
    
    return answer
}
