//
//  1092.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/07/03.
//

import Foundation

func solution1092() {
    let n: Int = Int(readLine()!)!
    var crane: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    let m: Int = Int(readLine()!)!
    var box: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    crane.sort(by: >)
    box.sort(by: >)
    let numberOfBox = box.count
    var answer: Int = 0
    var stack: [Int] = []
    while !box.isEmpty {
        answer += 1
        for w in crane {
            stack = []
            for b in 0..<box.count {
                if box[b] <= w {
                    stack.append(b)
                    break
                }
            }
            for i in stack{
                box.remove(at: i)
            }
            if box.isEmpty { break}
        }
        if answer > numberOfBox {
            answer = -1
            break
        }
    }
    
    print(answer)
}
