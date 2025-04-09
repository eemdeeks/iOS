//
//  Queue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/9/25.
//

func solution1005() {
    let fileIO = FileIO()
    let t = fileIO.readInt()  // 테스트케이스의 개수
    for _ in 0..<t {
        let n = fileIO.readInt()    // 건물의 개수
        let k = fileIO.readInt()    // 건설순서 규칙의 총 개수
        var during: [Int] = []
        for _ in 0..<n {
            let d = fileIO.readInt()
            during.append(d)
        }
        var map: [Set<Int>] = Array(repeating: [], count: n + 1)
        var insert: [Int] = Array(repeating: 0, count: n + 1)
        for _ in 0..<k {
            let x = fileIO.readInt()
            let y = fileIO.readInt()
            map[y].insert(x)
            insert[y] += 1
        }
        let w = fileIO.readInt()
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        var visited: [Bool] = Array(repeating: false, count: n + 1)
        var order: [Int] = []

        var queue = Queue(queue: [])
        for i in 1..<insert.count {
            if insert[i] == 0 {
                queue.append(i)
                visited[i] = true
            }
        }

        while !queue.isEmpty {
            guard let building = queue.removeFirst() else { break }
            order.append(building)
            if building == w {
                break
            }

            for i in 1..<map.count {
                if map[i].contains(building) {
                    insert[i] -= 1
                    if insert[i] == 0 {
                        queue.append(i)
                    }
                }
            }
        }

        for i in order {
            if map[i].count == 0 {
                dp[i] = during[i-1]
            } else {
                var array: [Int] = []
                for j in map[i] {
                    array.append(dp[j])
                }
                dp[i] = array.max()! + during[i-1]
            }
        }

        print(dp[w])
    }
    struct Queue {
        var queue: [Int]
        var head: Int = 0
        var isEmpty: Bool { queue.count <= head }

        mutating func append(_ element: Int) {
            queue.append(element)
        }

        mutating func removeFirst() -> Int? {
            if isEmpty { return nil }
            head += 1

            return queue[head - 1]
        }
    }

}
