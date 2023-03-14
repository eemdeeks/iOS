//
//  10845.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/10.
//

import Foundation

func solution10845(){
    let N : Int = Int(readLine()!)!
    var que : [Int] = []
    
    for _ in 1...N{
        let prob : [String] = readLine()!.components(separatedBy: " ")
        
        if prob[0] == "push"{
            que.append(Int(prob[1])!)
        }else if prob[0] == "pop" {
            if que.count == 0 {
                print("-1")
            }else{
                print(que[0])
                que.removeFirst()
            }
        }else if prob[0] == "size"{
            print(que.count)
        }else if prob[0] == "empty"{
            if que.isEmpty {
                print("1")
            }else{
                print("0")
            }
        }else if prob[0] == "front"{
            if que.isEmpty {
                print("-1")
            }else{
                print(que[0])
            }
        }else {
            if que.isEmpty {
                print("-1")
            }else{
                print(que[que.count-1])
            }
        }
    }
}
