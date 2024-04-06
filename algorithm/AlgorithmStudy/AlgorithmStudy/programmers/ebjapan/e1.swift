//
//  e1.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/6/24.
//

import Foundation

struct App {
    var total: Int
    var recent: Int
    init(total: Int = 0, recent: Int = 0) {
        self.total = total
        self.recent = recent
    }
}

func solutionE1(_ n:Int, _ recent:Int, _ recently_use:Int, _ total_use:Int, _ records:[[Int]]) -> [Int] {
    var allApp: [App] = Array(repeating: App(), count: n)
    var answer: [Int] = []
    for record in records {
        if record[0] <= recent {
            allApp[record[1]-1].recent += record[2]
        }
        allApp[record[1]-1].total += record[2]
    }
    for i in 0..<allApp.count{
        if allApp[i].recent <= recently_use && allApp[i].total < total_use {
            answer.append(i+1)
        }
    }
    return answer
}
