//
//  Pipe.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 6/26/25.
//


func solution17070() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var graph: [[Int]] = []

    for _ in 0..<n {
        var row: [Int] = []
        for _ in 0..<n { row.append(fileIO.readInt()) }
        graph.append(row)
    }

    if graph[n - 1][n - 1] == 1 {
        print(0)
        return
    }

    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

    var stack: [Pipe] = [.가로(index: (0, 1))]

    while !stack.isEmpty {
        let pipe = stack.removeLast()
        let index = pipe.index
        dp[index.x][index.y] += 1

        for newPipe in pipe.move(n: n, graph: graph) {
            stack.append(newPipe)
        }
    }

    print(dp[n - 1][n - 1])

    enum Pipe {
        case 가로(index: (x: Int, y: Int))
        case 대각선(index: (x: Int, y: Int))
        case 새로(index: (x: Int, y: Int))

        var index: (x: Int, y: Int) {
            switch self {
            case .가로(let index):
                return index
            case .대각선(let index):
                return index
            case .새로(let index):
                return index
            }
        }

        func move(n: Int, graph: [[Int]]) -> [Self] {
            var pipes: [Pipe] = []
            switch self {
            case .가로(let index):
                if index.y + 1 < n && graph[index.x][index.y + 1] == 0 {
                    pipes.append(.가로(index: (index.x, index.y + 1)))
                    if index.x + 1 < n && graph[index.x + 1][index.y] == 0 && graph[index.x + 1][index.y + 1] == 0 {
                        pipes.append(.대각선(index: (index.x + 1, index.y + 1)))
                    }
                }
            case .대각선(let index):
                if index.y + 1 < n && graph[index.x][index.y + 1] == 0 {
                    pipes.append(.가로(index: (index.x, index.y + 1)))
                    if index.x + 1 < n && graph[index.x + 1][index.y] == 0 && graph[index.x + 1][index.y + 1] == 0 {
                        pipes.append(.대각선(index: (index.x + 1, index.y + 1)))
                    }
                }

                if index.x + 1 < n && graph[index.x + 1][index.y] == 0 {
                    pipes.append(.새로(index: (index.x + 1, index.y)))
                }
            case .새로(let index):
                if index.x + 1 < n && graph[index.x + 1][index.y] == 0 {
                    pipes.append(.새로(index: (index.x + 1, index.y)))
                    if index.y + 1 < n && graph[index.x][index.y + 1] == 0 && graph[index.x + 1][index.y + 1] == 0 {
                        pipes.append(.대각선(index: (index.x + 1, index.y + 1)))
                    }
                }
            }

            return pipes
        }
    }
}
