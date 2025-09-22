//
//  피로도.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/29/24.
//

import Foundation

/*
 80,[[80,20],[50,40],[30,10]] -> 3
 */
func fatigue(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var visited: [Bool] = Array(repeating: false, count: dungeons.count)
    var answers: [Int] = []
    
    func exploration(_ fat: Int, _ answer: Int) {
        for i in 0..<dungeons.count {
            if fat >= dungeons[i][0] && visited[i] == false {
                visited[i] = true
                exploration(fat - dungeons[i][1], answer + 1)
                visited[i] = false
            }
        }
        answers.append(answer)
    }

    exploration(k, 0)
    return answers.max()!
}

