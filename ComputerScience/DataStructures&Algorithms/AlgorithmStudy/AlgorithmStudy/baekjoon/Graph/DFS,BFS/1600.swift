//
//  Queue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 8/29/25.
//

// visited 3중배열
func solution1600() {
    let fileIO = FileIO()

    let k = fileIO.readInt()
    let w = fileIO.readInt()
    let h = fileIO.readInt()

    var graph: [[Int]] = []

    for _ in 0..<h {
        var row: [Int] = []
        for _ in 0..<w {
            row.append(fileIO.readInt())
        }
        graph.append(row)
    }

    // [말 사용 횟수][x][y]
    // [
    //    [
    //      [-1, -1, -1, -1],
    //      [-1, -1, -1, -1],
    //      [-1, -1, -1, -1],
    //      [-1, -1, -1, -1]
    //                        ],
    //      ...                    ]
    var visited: [[[Int]]] = Array(
        repeating: Array(
            repeating: Array(
                repeating: -1,
                count: w)
            ,count: h),
        count: k + 1)

    var queue = Queue<(x: Int, y: Int, likeHorse: Int)>()
    queue.append((0, 0, 0))
    for i in 0...k {
        visited[i][0][0] = 0
    }

    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]

    let moveHorseX = [-2, -1, 1, 2, 2, 1, -1, -2]
    let moveHorseY = [1, 2, 2, 1, -1, -2, -2, -1]
    while !queue.isEmpty {
        guard let element = queue.removeFirst() else { break }
        
        for i in 0..<4 {
            let newX = element.x + moveX[i]
            let newY = element.y + moveY[i]

            if newX < 0 || newX >= h || newY < 0 || newY >= w {
                continue
            }

            if visited[element.likeHorse][newX][newY] != -1 || graph[newX][newY] == 1 {
                continue
            }

            visited[element.likeHorse][newX][newY] = visited[element.likeHorse][element.x][element.y] + 1
            queue.append((newX, newY, element.likeHorse))

            for j in (element.likeHorse)...k {
                if visited[j][newX][newY] != -1 && visited[j][newX][newY] <= visited[element.likeHorse][element.x][element.y] + 1 {
                    continue
                }
                visited[j][newX][newY] = visited[element.likeHorse][element.x][element.y] + 1
            }
        }

        if element.likeHorse >= k { continue }

        for i in 0..<8 {
            let newX = element.x + moveHorseX[i]
            let newY = element.y + moveHorseY[i]

            if newX < 0 || newX >= h || newY < 0 || newY >= w {
                continue
            }

            if visited[element.likeHorse + 1][newX][newY] != -1 || graph[newX][newY] == 1 {
                continue
            }

            visited[element.likeHorse + 1][newX][newY] = visited[element.likeHorse][element.x][element.y] + 1

            for j in (element.likeHorse + 1)...k {
                if visited[j][newX][newY] != -1 && visited[j][newX][newY] <= visited[element.likeHorse][element.x][element.y] + 1 {
                    continue
                }
                visited[j][newX][newY] = visited[element.likeHorse][element.x][element.y] + 1
            }
            queue.append((newX, newY, element.likeHorse + 1))
        }
    }

    var answer = -1
    for i in 0...k {
        if visited[i][h - 1][w - 1] == -1 { continue }
        if answer == -1 {
            answer = visited[i][h - 1][w - 1]
        } else {
            answer = min(answer, visited[i][h - 1][w - 1])
        }
    }

    print(answer)

    struct Queue<T> {
        var elements: [T] = []
        var head: Int = 0
        var isEmpty: Bool { elements.count <= head }

        mutating func append(_ element: T) { elements.append(element) }

        mutating func removeFirst() -> T? {
            if isEmpty { return nil }
            defer { head += 1 }
            return elements[head]
        }
    }
}
