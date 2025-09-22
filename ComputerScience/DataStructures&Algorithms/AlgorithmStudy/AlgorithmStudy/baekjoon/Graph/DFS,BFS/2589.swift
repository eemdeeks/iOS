//
//  2589.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/28/25.
//

func solution2589() {
    let length = readLine()!.split(separator: " ").map { Int(String($0))! }
    let height = length[0]
    let width = length[1]

    var map: [[String]] = []
    for _ in 0..<height {
        map.append(readLine()!.map { String($0) })
    }
    let moveX = [-1,0,1,0]
    let moveY = [0,1,0,-1]
    var maxLength = 0

    for x in 0..<height {
        for y in 0..<width {
            if map[x][y] == "W" {
                continue
            }
            var visitedMap: [[Bool]] = Array(repeating: Array(repeating: false, count: width), count: height)
            visitedMap[x][y] = true
            let node = Node(x: x, y: y, count: 0)
            var queue: [Node] = [node]
            var newNode: Node = node
            while !queue.isEmpty {
                newNode = queue.removeFirst()
                if maxLength < newNode.count {
                    maxLength = newNode.count
                }
                for index in 0..<4 {
                    let newX = newNode.x + moveX[index]
                    let newY = newNode.y + moveY[index]
                    if newX >= 0 && newY >= 0 && newX < height && newY < width {
                        if visitedMap[newX][newY] == false && map[newX][newY] == "L" {
                            let moveNode = Node(x: newNode.x + moveX[index], y: newNode.y + moveY[index], count: newNode.count + 1)
                            queue.append(moveNode)
                            visitedMap[newX][newY] = true
                        }
                    }
                }
            }
        }
    }
    print(maxLength)
}

struct Node {
    let x: Int
    let y: Int
    let count: Int
}
