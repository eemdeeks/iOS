//
//  1978.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/08.
//

import Foundation

func solution1978(N : Int, prob : [Int]){
    var so : [Bool] = []
    var answer = 0
    for i in 0...1000{
        so.append(true)
    }
    for i in 0...Int(sqrt(1000.0)){
        if i == 0 || i == 1 {
            so[i] = false
        }else{
            for j in stride(from: i+i, to: 1001, by: i){
                so[j] = false
            }
        }
    }
    for i in prob{
        if so[i] {
            answer += 1
        }
    }
    print(answer)
}
