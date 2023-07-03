//
//  11501.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/07/03.
//

import Foundation

func solution11501() {
    let t: Int = Int(readLine()!)!
    var n: Int
    var juga: [Int]
    for _ in 0..<t {
        n = Int(readLine()!)!
        juga = readLine()!.split(separator: " ").map{Int(String($0))!}
        juga.reverse()
        var answer = 0
        var maxJuga = juga[0]
        
        for i in 1..<juga.count{
            if juga[i] < maxJuga {
                answer += maxJuga - juga[i]
            } else {
                maxJuga = juga[i]
            }
        }
        
        print(answer)
    }
}
