//
//  10828.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/09.
//

import Foundation

func solution10828(N : Int){
    var prob : [String] = []
    var stack : [Int] = []
    for _ in 1...N{
        prob = readLine()!.components(separatedBy: " ")
        if prob[0] == "push"{
            stack.append(Int(prob[1])!)
        }else if prob[0] == "pop" {
            if stack.isEmpty {
                print("-1")
            }
            else{
                print(stack[stack.count-1])
                stack.remove(at: stack.count-1)
            }
        }else if prob[0] == "size"{
            print(stack.count)
        }else if prob[0] == "empty"{
            if stack.isEmpty {
                print("1")
            }else{
                print("0")
            }
        }else{
            if stack.isEmpty {
                print("-1")
            }
            else{
                print(stack[stack.count-1])
            }
        }
    }
}
