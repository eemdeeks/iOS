//
//  10845.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/10.
//

import Foundation

func solution10845(){
    var N : Int = Int(readLine()!)!
    var que : [Int] = []
    var prob : [String] = []
    for i in 1...N{
        prob = Array(arrayLiteral: readLine()!)
        
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
            
        }
    }
}
