//
//  solution1.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/25/23.
//

import Foundation

func solution1(_ friends:[String], _ gifts:[String]) -> Int {
    var give: [[Int]] = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    var receive: [[Int]] = Array(repeating: Array(repeating: 0, count: friends.count), count: friends.count)
    var jisu: [Int] = Array(repeating: 0, count: friends.count)
    var answer: [Int] = Array(repeating: 0, count: friends.count)

    for gift in gifts {
        var g = gift.split(separator: " ")
        var tuple = [0,0]
        for index in 0..<friends.count {
            if g[0] == friends[index] {
                tuple[0] = index
            }
            if g[1] == friends[index] {
                tuple[1] = index
            }
        }
        give[tuple[0]][tuple[1]] += 1
        receive[tuple[1]][tuple[0]] += 1
    }
    
    for i in 0..<friends.count {
        jisu[i] = give[i].reduce(0, +) - receive[i].reduce(0, +)
    }

    for i in 0..<friends.count-1 {
        for j in i+1..<friends.count {
            if give[i][j] < give[j][i] {
                answer[j] += 1
            }else if give[i][j] > give[j][i] {
                answer[i] += 1
            }else {
                if jisu[i] > jisu[j] {
                    answer[i] += 1
                } else if jisu[i] < jisu[j] {
                    answer[j] += 1
                }
            }
        }
    }
    return answer.max() ?? 0
}
