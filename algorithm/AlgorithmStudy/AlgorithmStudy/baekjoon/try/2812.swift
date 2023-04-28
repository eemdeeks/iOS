//
//  2812.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/28.
//

import Foundation

func solution2812() {
    var nk : [Int] = readLine()!.components(separatedBy: " ").map({
        Int(String($0))!
    })
    let len = nk[0] - nk[1]
    let prob : [Int] = Array(readLine()!).map({Int(String($0))!})

    var stack : [Int] = []
    
    for i in 0..<nk[0]{
        while true{
            if stack.isEmpty {
                stack.append(prob[i])
                break
            } else if stack[stack.count-1] < prob[i] && nk[1] != 0 {
                stack.removeLast()
                nk[1] -= 1
            } else {
                stack.append(prob[i])
                break
            }
        }
    }
    
    while stack.count != len {
        stack.removeLast()
    }
    print(stack.map{String($0)}.joined(separator: ""))
}
