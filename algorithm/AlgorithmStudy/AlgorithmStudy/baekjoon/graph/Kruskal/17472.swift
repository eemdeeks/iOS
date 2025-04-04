//
//  Queue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/3/25.
//


func solution17472() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0] // 세로 길이
    let m = input[1] // 가로 길이
    var map: [[Int]] = [] // 지도

    for _ in 0..<n {
        map.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    // 섬찾기 dfs
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    var queue: Queue = Queue()
    var islands: [[Point]] = []
    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]
    var island: [Point]

    for i in 0..<n {
        for j in 0..<m {
            if visited[i][j] || map[i][j] == 0 {
                continue
            }
            queue = Queue()
            queue.append(Point(x: i, y: j))
            island = []
            while !queue.isEmpty {
                guard let point = queue.removeLast() else { break }
                if visited[point.x][point.y] {
                    continue
                }
                visited[point.x][point.y] = true
                island.append(point)

                for index in 0..<4 {
                    let newX = point.x + moveX[index]
                    let newY = point.y + moveY[index]

                    if newX < 0 || newY < 0 || newX >= n || newY >= m {
                        continue
                    }

                    if map[newX][newY] == 0 || visited[newX][newY] {
                        continue
                    }

                    queue.append(Point(x: newX, y: newY))
                }
            }

            islands.append(island)
        }
    }

    // 다리 찾기
    var edges: [[Int]] = [] // [섬1, 섬2, 다리길이]

    for islandNum in 0..<islands.count {
        for point in islands[islandNum] {
            for index in 0..<4 {
                var newPoint = point
                var length = 0
                while true {
                    let newX = newPoint.x + moveX[index]
                    let newY = newPoint.y + moveY[index]

                    if newX < 0 || newY < 0 || newX >= n || newY >= m {
                        break
                    }

                    if map[newX][newY] == 1 {

                        if length >= 2 {
                            let rightIslandNum = findIsland(Point(x: newX, y: newY))
                            edges.append([islandNum, rightIslandNum, length])
                        }
                        break
                    }

                    newPoint = Point(x: newX, y: newY)
                    length += 1

                }
            }
        }
    }

    // 최소스패닝트리로 다리들 찾기
    var answerEdges: [Int] = []
    var islandPower: [Int] = []
    var islandParent: [Int] = []

    for islandNum in 0..<islands.count {
        islandPower.append(0)
        islandParent.append(islandNum)
    }

    edges.sort { $0[2] < $1[2] }

    for edge in edges {
        if findParent(edge[0]) != findParent(edge[1]) {
            answerEdges.append(edge[2])
            union(edge[0], edge[1])
        }
    }

    if answerEdges.count < islands.count-1 {
        print(-1)
    } else {
        print(answerEdges.reduce(0, +))
    }

    func findParent(_ islandNum: Int) -> Int {
        let parent = islandParent[islandNum]
        if parent == islandNum { return islandNum }
        return findParent(parent)
    }

    func union(_ left: Int, _ right: Int) {
        let leftParent = findParent(left)
        let rightParent = findParent(right)

        if islandPower[leftParent] == islandPower[rightParent] {
            islandParent[rightParent] = leftParent
            islandPower[leftParent] += 1
        } else if islandPower[leftParent] > islandPower[rightParent] {
            islandParent[rightParent] = leftParent
        } else {
            islandParent[leftParent] = rightParent
        }
    }

//    print(edges)

//    for island in islands {
//        for point in island {
//            print("\(point.x)\(point.y)", terminator: "\t")
//        }
//        print()
//    }

    func findIsland(_ point: Point) -> Int {
        for islandNum in 0..<islands.count {
            if islands[islandNum].contains(point) {
                return islandNum
            }
        }
        return 0
    }

    struct Queue {
        var queue: [Point] = []
        var point: Int = 0
        var isEmpty: Bool { queue.count <= point }

        mutating func append(_ element: Point) {
            queue.append(element)
        }

        mutating func removeLast() -> Point? {
            if isEmpty { return nil }
            point += 1
            return queue[point-1]
        }
    }

    struct Point: Equatable {
        let x, y: Int
    }
}
