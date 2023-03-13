//
//  11653.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/13.
//

import Foundation

func solution11653(){
    var prob : Int = Int(readLine()!)!
    var prime : Int = 2
    while prob != 1 {
        if prob % prime == 0 {
            prob /= prime
            print(prime)
        }else{
            prime += 1
        }
    }
}
