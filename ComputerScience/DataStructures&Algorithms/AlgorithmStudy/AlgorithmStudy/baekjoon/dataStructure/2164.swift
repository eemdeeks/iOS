//
//  2164.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/15.
//

import Foundation

func solution2164() {
    let n = Int(readLine()!)!
    var cards : [Int] = [0]
    if n == 1 || n == 2 {
        print(n)
    }else {
        for i in 1...n {
            cards.append(i)
        }
        for i in 1...n-2 {
            
            cards.append(cards[2*i])
        }
        print(cards[cards.count-1])
    }
    
}
