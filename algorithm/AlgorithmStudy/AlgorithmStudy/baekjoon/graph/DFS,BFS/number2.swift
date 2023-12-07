//
//  number2.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/18/23.
//

import Foundation

func number2(_ n: Int,_ prob: [Int]) -> [Int] {

    var returnAnswer: [Int] = [1,1]

    if prob.count == 1 {
        return [1]
    } else if prob.count == 2 {
        return [1,1]
    } else {
        for index in 2..<prob.count {
            var list: [[Int]] = []
            var graph: [[Int]] = []

            for i in 0...index {
                list.append([prob[i],prob[i]+n-1])
                graph.append([])
            }
            for i in 0..<list.count {
                for j in 0..<list.count {
                    if i != j {
                        if list[i][0] <= list[j][0] && list[i][1] >= list[j][0] {
                            graph[i].append(j)
                        } else if list[i][0] >= list[j][0] && list[i][0] <= list[j][1] {
                            graph[i].append(j)
                        }
                    }
                }
            }
            var answer: Set<Int> = []
            print(graph)
            for index in 0..<graph.count {
                dfsForTest(graph: graph, start: index, depths: &answer)
            }
            returnAnswer.append(answer.count)
        }
    }
    return returnAnswer
}
func dfsForTest(graph: [[Int]], start: Int, depths: inout Set<Int>) {
    var needVisitStack: Set<Int> = [start]
    var visitedQueue: Set<Int> = []
    var depth: Int = 0
    while !needVisitStack.isEmpty {
        let node = needVisitStack.removeFirst()
        visitedQueue.insert(node)
        var appendNum = 0
        for i in graph[node] {
            if !visitedQueue.contains(i) {
                needVisitStack.insert(i)
                appendNum += 1
            }
        }
        if appendNum == 0 {
            depths.insert(depth)
        } else {

        }
        depth += 1
    }
}

//
//func dfs(_ graph: [[Int]],
//         _ startNode: Int,
//         _ visited: inout [Bool],
//         _ num: Int,
//         _ answer: inout Set<Int>
//        ){
//    visited[startNode] = true
//    print(startNode)
//    var depth = num
//    depth += 1
//
//    for nextNode in graph[startNode] {
//        if !visited[nextNode] {
//            dfs(graph, nextNode, &visited, depth, &answer)
//        } else {
//            answer.insert(depth)
//        }
//    }
//}

func dfs(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitStack: [String] = [start]

    while !needVisitStack.isEmpty {
        let node: String = needVisitStack.removeLast()
        if visitedQueue.contains(node) { continue }

        visitedQueue.append(node)
        needVisitStack += graph[node] ?? []
    }

    return visitedQueue
}

