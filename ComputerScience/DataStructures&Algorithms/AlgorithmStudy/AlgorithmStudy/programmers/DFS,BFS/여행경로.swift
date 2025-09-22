//
//  여행경로.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/1/24.
//

import Foundation

/*
 [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
 -> ["ICN", "JFK", "HND", "IAD"]

 [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL","SFO"]]
 -> ["ICN", "ATL", "ICN", "SFO", "ATL", "SFO"]
 */
func travelRoute(_ tickets:[[String]]) -> [String] {
    var answer: [[String]] = []
    var used: [Bool] = Array(repeating: false, count: tickets.count)

    func bfs(_ route: [String]) {
        if route.count == tickets.count + 1 {
            answer.append(route)
            return
        }
        for i in 0..<tickets.count {
            if used[i] == false && route.last == tickets[i][0] {
                used[i] = true
                bfs(route+[tickets[i][1]])
                used[i] = false
            }
        }
    }
    
    bfs(["ICN"])
    answer.sort {
        $0.lexicographicallyPrecedes($1)
    }
    return answer[0]
}
