//
//  1976.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/27/25.
//

func solution1976() {
    let n: Int = Int(readLine()!)!
    let m: Int = Int(readLine()!)!
    var citys: [[Int]] = [[]]

    for _ in 0..<n {
        let info: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
        var edges: [Int] = []
        for i in 0..<n {
            if info[i] == 1 {
                edges.append(i+1)
            }
        }
        citys.append(edges)
    }

    var answer: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

    var stack: [Int] = [answer.removeLast()]
    var visited: Set<Int> = []

    while !stack.isEmpty {
        let city = stack.removeLast()
        visited.insert(city)
        for i in citys[city] {
            if !visited.contains(i) {
                stack.append(i)
            }
        }
    }

    for i in answer {
        if !visited.contains(i) {
            print("NO")
            return
        }
    }
    print("YES")
}
