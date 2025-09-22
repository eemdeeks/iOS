//
//  3109.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/6/25.
//

//func solution3109() {
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let xCount = input[0]
//    let yCount = input[1]
//    var graph: [[String]] = []
//    for _ in 0..<xCount {
//        graph.append(readLine()!.map { String($0) })
//    }
//    var visitedIndex = Array(repeating: Array(repeating: false, count: yCount), count: xCount)
//    let moveX: [Int] = [-1,0,1]
//
//    func move(index: (Int,Int), graph: [[String]], visited: [[Bool]]) -> Bool {
//        var newVisited = visited
//        newVisited[index.0][index.1] = true
//
//        if index.1 == yCount-1 {
//            visitedIndex = newVisited
//            return true
//        }
//        for i in moveX {
//            let newIndex = (index.0 + i, index.1 + 1)
//            if newIndex.0 < 0 || newIndex.0 > xCount-1 || newIndex.1 < 0 || newIndex.1 > yCount-1 {
//                continue
//            }
//            if graph[newIndex.0][newIndex.1] == "." && !newVisited[newIndex.0][newIndex.1] {
//                let flag = move(index: newIndex, graph: graph, visited: newVisited)
//                if flag { return true }
//            }
//        }
//        return false
//    }
//    var answer = 0
//    for x in 0..<xCount {
//        if move(index: (x,0), graph: graph, visited: visitedIndex) { answer += 1}
//    }
//    print(answer)
//}

func solution3109() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let xCount = input[0]
    let yCount = input[1]
    var graph: [[String]] = []
    for _ in 0..<xCount {
        graph.append(readLine()!.map { String($0) })
    }
    var visitedIndex = Array(repeating: Array(repeating: false, count: yCount), count: xCount)
    let moveX: [Int] = [1,0,-1]
    var queue: [(Int,Int)] = []

    var answer = 0
    for x in 0..<xCount {
        queue = [(x,0)]
        while !queue.isEmpty {
            let index = queue.removeLast()
            visitedIndex[index.0][index.1] = true
            if index.1 == yCount-1 {
                answer += 1
                break
            }
            for i in moveX {
                let newIndex = (index.0 + i, index.1 + 1)
                if newIndex.0 < 0 || newIndex.0 > xCount-1 || newIndex.1 < 0 || newIndex.1 > yCount-1 {
                    continue
                }
                if graph[newIndex.0][newIndex.1] == "." && !visitedIndex[newIndex.0][newIndex.1] {
                    queue.append(newIndex)
                }
            }
        }
    }
    print(answer)
}
