//
//  17144.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/20/25.
//

func solution17144() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))!}
    let r = input[0]
    let c = input[1]
    let t = input[2]
    var dusts: [[Int]] = []
    let moveX = [-1,0,1,0]
    let moveY = [0,-1,0,1]
    var spread = 0
    var queue: [[Int]] = []
    var airConX: [Int] = []

    for i in 0..<r {
        let dust = readLine()!.split(separator: " ").map { Int(String($0))!}
        dusts.append(dust)
    }

    for time in 0..<t {
        airConX = []
        for x in 0..<r {
            for y in 0..<c {
                spread = 0
                if dusts[x][y] == -1 {
                    airConX.append(x)
                }
                if dusts[x][y] >= 5 {
                    for i in 0..<4 {
                        if x + moveX[i] >= 0 && x + moveX[i] < r && y + moveY[i] >= 0 && y + moveY[i] < c && dusts[x+moveX[i]][y+moveY[i]] != -1 {
                            spread += 1
                            queue.append([x+moveX[i],y+moveY[i],dusts[x][y]/5])
                        }
                    }

                    dusts[x][y] -= dusts[x][y]/5 * spread
                }
            }
        }

        while !queue.isEmpty {
            let move = queue.removeLast()
            dusts[move[0]][move[1]] += move[2]
        }

        var indexY = 0
        var indexX = airConX[0]-1
        while indexX != 0 {
            dusts[indexX][0] = dusts[indexX-1][0]
            indexX -= 1
        }
        while indexY != c-1 {
            dusts[0][indexY] = dusts[0][indexY+1]
            indexY += 1
        }
        while indexX != airConX[0] {
            dusts[indexX][c-1] = dusts[indexX+1][c-1]
            indexX += 1
        }
        while indexY != 0 {
            dusts[indexX][indexY] = dusts[indexX][indexY-1] != -1 ? dusts[indexX][indexY-1]: 0
            indexY -= 1
        }

        indexX = airConX[1] + 1
        while indexX != r-1 {
            dusts[indexX][0] = dusts[indexX+1][0]
            indexX += 1
        }
        while indexY != c-1 {
            dusts[r-1][indexY] = dusts[r-1][indexY+1]
            indexY += 1
        }
        while indexX != airConX[1] {
            dusts[indexX][c-1] = dusts[indexX-1][c-1]
            indexX -= 1
        }
        while indexY != 0 {
            dusts[indexX][indexY] = dusts[indexX][indexY-1] != -1 ? dusts[indexX][indexY-1]: 0
            indexY -= 1
        }
    }

    var answer = 0

    for dust in dusts {
        for value in dust {
            answer += value
        }
    }
    print(answer + 2)
}
