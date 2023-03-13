//
//  9020.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/13.
//

import Foundation

func solution9020(){
    var T : Int = Int(readLine()!)!
    var prime : [Bool] = []
    var primeInt : [Int] = []
    for _ in 0...10000{
        prime.append(true)
    }
    prime[0] = false
    prime[1] = false
    for i in 2...Int(sqrt(10000)){
        for j in stride(from: i+i, to: 10001, by: i){
            prime[j] = false
        }
    }
    for i in 2...10000{
        if prime[i] {
            primeInt.append(i)
        }
    }
    
    
    for _ in 1...T{
        var answer : [(Int,Int)] = []
        var answerSub : Int = 10000
        var n : Int = Int(readLine()!)!
    
        for i in 0...primeInt.count-1{
            for j in i...primeInt.count-1{
                if primeInt[i] + primeInt[j] == n {
                    answer.append((primeInt[i],primeInt[j]))
                    break
                }else if primeInt[i] + primeInt[j] > n{
                    break
                }
            }
            if i > n {
                break
            }
    
        }
        var index : Int = 0
        for i in 0...answer.count-1{
            if answer[i].1 - answer[i].0 < answerSub{
                answerSub = answer[i].1 - answer[i].0
                index = i
            }
        }
        print(answer[index].0, answer[index].1)
    }
    
}
