//
//  6588.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/14.
//

import Foundation

func solution6588(){
    var prime : [Bool] = []
    
    for _ in 1...1000000{
        prime.append(true)
    }
    prime[0] = false
    prime[1] = false
    
    for i in 2...Int(sqrt(1000000)){
        for j in stride(from: i+i, to: 1000000, by: i){
            prime[j] = false
        }
    }
    
    while true{
        var answer : [(Int,Int)] = []
        let n : Int = Int(readLine()!)!
        if n == 0 {
            break
        }
        for i in 3...Int(n/2){
            if prime[n - i]{
                if prime[i]{
                    answer.append((i,n-i))
                    break
                }
            }
        }
        switch answer.count {
        case 0:
            print("Goldbach's conjecture is wrong.")
        default:
            print(n,"=",answer[0].0,"+",answer[0].1)
        }
    
    }
}
