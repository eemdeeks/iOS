//
//  1182.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/15.
//

import Foundation

func solution1182(){
    let N : [Int] = readLine()!.split(separator: " ").map{
        Int(String($0))!
    }
    let S : [Int] = readLine()!.split(separator: " ").map{
        Int(String($0))!
    }
    var answer : Int = 0
    
    for i in 1...N[0]{
        for j in 0...S.count-1{
            var sumNum = 0
            if j + i > S.count-1{
                break
            }else{
                for k in 0...i-1{
                    sumNum += S[j+k]
                }
                if sumNum == N[1]{
                    answer += 1
                }
            }
        }
    }
    print(answer)
}
