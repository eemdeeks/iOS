//
//  1929.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/07.
//

import Foundation

func solution1929(M : Int, N : Int){
    var chae : [Bool] = []
    for i in 0...N{
        chae.append(true)
    }
    for i in 0...Int(sqrt(Double(N))){
        if i == 0 || i == 1 {
            chae[i] = false
        }else{
            for j in stride(from: i+i, through: N, by: i){
                chae[j] = false
            }
        }
        
    }
    for i in M...N {
        if chae[i] == true{
            print(i)
        }
    }
}
