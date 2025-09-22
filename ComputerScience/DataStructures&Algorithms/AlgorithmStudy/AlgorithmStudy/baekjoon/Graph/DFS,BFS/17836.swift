//
//  Hero.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/2/25.
//

func solution17836() {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]
    let t = input[2]
    var map: [[Int]] = []
    for i in 0..<n {
        map.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]

    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
    var visitedWithKey = visited
    var queue: Queue17836 = Queue17836(queue: [Hero(x: 0, y: 0, key: false, t: 0)])
    var answer = 10001
    while !queue.isEmpty {
        var popHero = queue.removeFirst()!
        if popHero.x == n - 1 && popHero.y == m - 1 {
            answer = min(answer, popHero.t)
            continue
        }

        for i in 0..<4 {
            let x = popHero.x + moveX[i]
            let y = popHero.y + moveY[i]
            var key = popHero.key

            if x < 0 || y < 0 || x > n-1 || y > m-1 {
                continue
            }

            if key {
                if visitedWithKey[x][y] {
                    continue
                }
                visitedWithKey[x][y] = true
            } else {
                if visited[x][y] || map[x][y] == 1 {
                    continue
                }
                visited[x][y] = true
            }
            if map[x][y] == 2 {
                key = true
            }
            queue.append(Hero(x: x, y: y, key: key, t: popHero.t + 1))
        }
    }
    if answer > t {
        print("Fail")
    } else {
        print(answer)
    }
}


struct Hero {
    var x: Int
    var y: Int
    var key: Bool
    var t: Int
}

struct Queue17836 {
    var queue: [Hero]
    var point: Int = 0

    var isEmpty: Bool {
        queue.count <= point
    }

    mutating func append(_ hero: Hero) {
        queue.append(hero)
    }

    mutating func removeFirst() -> Hero? {
        if isEmpty { return nil }
        point += 1
        return queue[point-1]
    }
}
