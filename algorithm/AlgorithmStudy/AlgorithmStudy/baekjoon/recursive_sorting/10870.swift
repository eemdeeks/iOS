//
//  10870.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/18.
//

import Foundation

func solution10870() {
    let n = Int(readLine()!)!
    
    print(fibonachi(n: n))
}
func fibonachi(n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    return fibonachi(n: n-1) + fibonachi(n: n-2)
}

