//
//  1541.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/07/07.
//

import Foundation

func solution1541() {
    var input = readLine()!
    var minusSplit = input.split(separator: "-")
    var stack: [Int] = []
    var index = 0
    for i in minusSplit {
        if i.contains("+"){
            index = i.split(separator: "+").map{Int(String($0))!}.reduce(0,+)
        }else{
            index = Int(i)!
        }
        
        stack.append(index)
    }
    var first = stack.removeFirst()
    print(stack.reduce(first, -))
}
