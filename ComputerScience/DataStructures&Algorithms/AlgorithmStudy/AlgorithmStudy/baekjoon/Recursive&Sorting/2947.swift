//
//  2947.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/30.
//

import Foundation

func solution2947() {
    var input : [Int] = readLine()!.components(separatedBy: " ").map({ Int(String($0))!})
    var num = 0
    while input != [1,2,3,4,5]{
        for i in 0...input.count-2{
            if input[i] > input[i+1]{
                num = input[i+1]
                input[i+1] = input[i]
                input[i] = num
                print(input.map{String($0)}.joined(separator: " "))
                if input == [1,2,3,4,5]{
                    break
                }
            }
        }
    }
}
