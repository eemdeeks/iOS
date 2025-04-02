//
//  Queue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/3/25.
//

func solution16234() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let l = input[1]
    let r = input[2]
    var map: [[Int]] = []

    for _ in 0..<n {
        map.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]

    var answer: Int = 0
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    var queue = Queue()
    var trees: [([[Int]], Int)] = []
    while true {
        visited = Array(repeating: Array(repeating: false, count: n), count: n)
        queue = Queue()
        trees = []
        for x in 0..<n {
            for y in 0..<n {
                if !visited[x][y] {
                    queue.append([x,y])
                    var tree: [[Int]] = []
                    var sum: Int = 0
                    while !queue.isEmpty {
                        guard let node = queue.removeFirst() else { return }
                        if visited[node[0]][node[1]] {
                            continue
                        }
                        tree.append(node)
                        sum += map[node[0]][node[1]]
                        visited[node[0]][node[1]] = true

                        for i in 0..<4 {
                            let newX = node[0] + moveX[i]
                            let newY = node[1] + moveY[i]
                            if newX < 0 || newY < 0 || newX >= n || newY >= n {
                                continue
                            }
                            if visited[newX][newY] {
                                continue
                            }

                            let value = abs(map[newX][newY] - map[node[0]][node[1]])
                            if value >= l && value <= r {
                                queue.append([newX, newY])
                            }
                        }
                    }
                    trees.append((tree, sum))
                }
            }
        }

        var flag = false
        for i in trees {
            if i.0.count == 1 { continue }
            let value = i.1 / i.0.count
            for j in i.0 {
                map[j[0]][j[1]] = value
            }
            flag = true
        }
        if !flag { break }
        answer += 1
        if answer > 2000 { break }
    }
    print(answer)

    struct Queue {
        var queue: [[Int]] = []
        var point: Int = 0
        var isEmpty: Bool {
            queue.count <= point
        }

        mutating func append(_ element: [Int]) {
            queue.append(element)
        }

        mutating func removeFirst() -> [Int]? {
            if isEmpty { return nil }
            point += 1
            return queue[point-1]
        }
    }
}

