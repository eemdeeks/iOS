//
//  14502.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/11/26.
//


func solution14502() {
    let fileIO = FileIO()

    let rowCount: Int = fileIO.readInt()
    let colCount: Int = fileIO.readInt()

    var labs: [[Int]] = []
    var viruses: [(x: Int, y: Int)] = []    // 2
    var emptyRooms: [(x: Int, y: Int)] = []  // 0

    for x in 0..<rowCount {
        var row: [Int] = []
        for y in 0..<colCount {
            let value = fileIO.readInt()
            switch value {
            case 0:
                emptyRooms.append((x, y))
            case 2:
                viruses.append((x, y))
            default:
                break
            }
            row.append(value)
        }
        labs.append(row)
    }

    print(track(0, []))

    func track(_ n: Int, _ newWalls: [(x: Int, y: Int)]) -> Int {
        if newWalls.count == 3 {
            return countSafeArea(
                spreadVirus(labs, viruses, newWalls)
            )
        }

        if n >= emptyRooms.count {
            return 0
        }

        return max(track(n + 1, newWalls + [emptyRooms[n]]), track(n + 1, newWalls))
    }

    func spreadVirus(_ labs: [[Int]], _ viruses: [(x: Int, y: Int)], _ newWalls: [(x: Int, y: Int)]) -> [[Int]] {
        var newLabs = labs

        for newWall in newWalls {
            newLabs[newWall.x][newWall.y] = 1
        }
        
        var stack: [(x: Int, y: Int)] = viruses

        let moveX = [-1, 0, 1, 0]
        let moveY = [0, -1, 0, 1]

        while !stack.isEmpty {
            let virusRoom = stack.removeLast()

            for i in 0..<4 {
                let newX = virusRoom.x + moveX[i]
                let newY = virusRoom.y + moveY[i]

                if newX < 0 || newY < 0 || newX >= rowCount || newY >= colCount {
                    continue
                }

                if newLabs[newX][newY] != 0 {
                    continue
                }

                stack.append((newX, newY))
                newLabs[newX][newY] = 2
            }
        }

        return newLabs
    }

    func countSafeArea(_ labs: [[Int]]) -> Int {
        return labs
            .flatMap { $0 }
            .filter { $0 == 0 }
            .count
    }
}
