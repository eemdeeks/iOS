//
//  2609.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/08.
//

import Foundation

func solution2609(n : Int, m : Int){
    var biggest : Int = 0
    var least : Int = 0
    let small = min(n,m)
    let big = max(n, m)
    for i in 1...small{
        if n%i == 0 && m%i == 0 {
            biggest = i
        }
    }
    for i in 1...small{
        if big * i % small == 0 {
            least = big * i
            break
        }
    }
    
    print(biggest)
    print(least)
}
