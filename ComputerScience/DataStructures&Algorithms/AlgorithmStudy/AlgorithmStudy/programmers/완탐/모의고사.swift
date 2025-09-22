//
//  모의고사.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/29/24.
//

import Foundation

func motest(_ answers:[Int]) -> [Int] {
    var hum1: [Int] = [1,2,3,4,5]
    var hum2: [Int] = [2,1,2,3,2,4,2,5]
    var hum3: [Int] = [3,3,1,1,2,2,4,4,5,5]

    var score: [Int] = [0,0,0]
    var answer: [Int] = []
    for i in 0..<answers.count {
        if answers[i] == hum1[i%5] { score[0] += 1}
        if answers[i] == hum2[i%8] { score[1] += 1}
        if answers[i] == hum3[i%10] { score[2] += 1}
    }
    if let max = score.max() {
        for index in 0..<3 {
            if score[index] == max {
                answer.append(index+1)
            }
        }
    }
    return answer
}
