//
//  18258.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/16.
//

import Foundation

func solution18258(){
    let N : Int = Int(readLine()!)!
    var que : [Int] = []
    var firstIndex : Int = 0
    for _ in 1...N{
        let prob : [String] = readLine()!.components(separatedBy: " ")
        let queSize : Int = que.count - firstIndex
        switch prob[0]{
        case "push" :
            que.append(Int(prob[1])!)
        case "pop" :
            if queSize == 0 {
                print(-1)
            }else{
                print(que[firstIndex])
                firstIndex += 1
            }
        case "size":
            print(queSize)
        case "empty":
            if queSize == 0 {
                print(1)
            }else{
                print(0)
            }
        case "front":
            if queSize == 0 {
                print(-1)
            }else{
                print(que[firstIndex])
            }
        default:
            if queSize == 0 {
                print(-1)
            }else{
                print(que[que.count-1])
            }
        }
    }
}
