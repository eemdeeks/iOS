//
//  17103.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/16.
//

import Foundation

func solution17103(){
    let T : Int = Int(readLine()!)!
    var prime : [Bool] = []
    
    for _ in 0...1000000{
        prime.append(true)
    }
    prime[0] = false
    prime[1] = false
    for i in 2...Int(sqrt(1000000)){
        for j in stride(from: i+i, to: 1000001, by: i){
            prime[j] = false
        }
    }
    
    for _ in 1...T{
        var answer : Int = 0
        let prob : Int = Int(readLine()!)!
        if prob == 4 {
            print(1)
        }else{
            for j in 3...prob/2{
                if prime[j]{
                    if prime[prob - j]{
                        answer += 1
                    }
                }
            }
            print(answer)
        }
    }
}
