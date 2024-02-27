//
//  단어변환.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/27/24.
//

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var graph: [[Int]] = []
    var dict: [String:Int] = [:]
    guard words.contains(target) else { return 0 }

    for index in words.indices {
        dict[words[index]] = index
    }
    for word in words {
        var contain: [Int] = []
        for comp in words {
            if word == comp {
                continue
            }
            var num: Int = 0
            for index in comp.indices {
                if word[index] == comp[index] {
                    num += 1
                }
            }
            if num == word.count-1 {
                if let dictIndex = dict[comp] {
                    contain.append(dictIndex)
                }
            }
        }
        graph.append(contain)
    }
    var contain: [Int] = []
    for word in words {
        var num: Int = 0
        for index in word.indices {
            if begin[index] == word[index] {
                num += 1
            }
        }
        if num == word.count-1 {
            if let dictIndex = dict[word] {
                contain.append(dictIndex)
            }
        }
    }
    graph.append(contain)
    print(graph)

    return bfs(graph, words.count, dict[target] ?? 0)
}

func bfs(_ graph: [[Int]], _ begin: Int, _ target: Int) -> Int {
    var visit : [Int] = []
    var queue: Set<Int> = [begin]
    var depth: Int = 0
    while !queue.isEmpty {
        var set: Set<Int> = []
        depth += 1
        for new in queue {
            visit.append(new)
            print(new)
            for i in graph[new] {
                if !visit.contains(i) {
                    set.insert(i)
                    if i == target {
                        return depth
                    }
                }
            }
        }
        queue = set
        print(queue)
    }
    return 0
}
