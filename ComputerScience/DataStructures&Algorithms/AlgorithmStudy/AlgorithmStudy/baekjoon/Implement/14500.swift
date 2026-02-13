//
//  Position.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/13/26.
//


func solution14500() {
    let fileIO = FileIO()

    let rowCount = fileIO.readInt()
    let colCount = fileIO.readInt()

    var paper: [[Int]] = []

    for _ in 0..<rowCount {
        var rowValues: [Int] = []
        for _ in 0..<colCount {
            rowValues.append(fileIO.readInt())
        }
        paper.append(rowValues)
    }

    var answer: Int = 0
    var visited = Array(
        repeating: Array(repeating: false, count: colCount),
        count: rowCount
    )

    // ㅜ, ㅓ, ㅗ, ㅏ
    let moveX = [
        [0, 0, 1],
        [-1, -2, -1],
        [0, 0, -1],
        [-1, -2, -1]
    ]

    let moveY = [
        [1, 2, 1],
        [0, 0, -1],
        [1, 2, 1],
        [0, 0, 1]
    ]

    for x in 0..<rowCount {
        for y in 0..<colCount {
            visited[x][y] = true
            answer = max(dfs(3, paper[x][y], Position(x: x, y: y)), answer)
            visited[x][y] = false

            for i in 0..<4 {
                var value = paper[x][y]
                var flag = false
                for j in 0..<3 {
                    let newX = x + moveX[i][j]
                    let newY = y + moveY[i][j]

                    if newX < 0 || newY < 0 || newX >= rowCount || newY >= colCount {
                        flag = true
                        break
                    }
                    value += paper[newX][newY]
                }

                if flag { continue }

                answer = max(value, answer)
            }
        }
    }

    print(answer)



    struct Position: Hashable {
        let x: Int
        let y: Int

        func move(_ rowCount: Int, _ colCount: Int) -> [Position] {
            let moveX = [-1, 0, 1, 0]
            let moveY = [0, -1, 0, 1]

            var result: [Position] = []

            for i in 0..<4 {
                let newX = moveX[i] + x
                let newY = moveY[i] + y

                if newX < 0 || newY < 0 || newX >= rowCount || newY >= colCount {
                    continue
                }

                result.append(Position(x: newX, y: newY))
            }

            return result
        }
    }

    func dfs(_ count: Int, _ value: Int, _ start: Position ) -> Int {
        if count == 0 {
            return value
        }

        var result = 0
        for newPosition in start.move(rowCount, colCount) where !visited[newPosition.x][newPosition.y] {

            visited[newPosition.x][newPosition.y] = true
            result = max(result, dfs(count - 1, value + paper[newPosition.x][newPosition.y], newPosition))
            visited[newPosition.x][newPosition.y] = false
        }

        return result
    }

}
