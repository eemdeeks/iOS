//
//  4948.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/08.
//

import Foundation

func solution4948(n : Int){
    var so : [Bool] = []
    var answer = 0
    for _ in 0...246912{
        so.append(true)
    }
    so[0] = false
    so[1] = false
    for i in 2...Int(sqrt(246912)){
        for j in stride(from: i+i, to: 246913, by: i){
            so[j] = false
        }
    }
    for i in (n+1)...2*n{
        if so[i] {
            answer += 1
        }
    }
    print(answer)
}
