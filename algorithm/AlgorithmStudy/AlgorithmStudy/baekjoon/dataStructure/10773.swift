//
//  10773.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/09.
//

import Foundation

func solution10773(K : Int){
    var stack : [Int] = []
    var num : Int = 0
    for _ in 1...K{
        num = Int(readLine()!)!
        if num == 0{
            stack.remove(at: stack.count-1)
        }else{
            stack.append(num)
        }
    }
    print(stack.reduce(0, +))
}
