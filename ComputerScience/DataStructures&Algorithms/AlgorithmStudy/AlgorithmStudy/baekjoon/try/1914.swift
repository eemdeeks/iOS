//
//  1914.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/18.
//

import Foundation

func solution1914() {
    let n = Int(readLine()!)!
    print(hanoi(n: n))
}
func hanoi(n : Int) -> Int {
    if n == 1{
        return 1
    }else{
        return hanoi(n: n-1) * 2 + 1
    }
}
func hanoiView(n : Int) -> Int{
    
    return 1
}


