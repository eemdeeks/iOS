//
//  1406.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/14.
//

import Foundation

func solution1406(){
    var left : [String] = Array(readLine()!.components(separatedBy: ""))
    var right : [String] = []
    
    let n = Int(readLine()!)!
    for _ in 1...n{
        let command = readLine()!.components(separatedBy: " ")
        if command[0] == "L"{
            if left.count != 0{
                right.append(left[left.count-1])
                left.removeLast()
            }
        }else if command[0] == "D"{
            if right.count != 0{
                left.append(right[right.count-1])
                right.removeLast()
            }
        }else if command[0] == "B"{
            if left.count != 0{
                left.removeLast()
            }
        }else{
            left.append(command[1])
        }
    }
    
    right.reverse()
    for i in left{
        print(i,terminator: "")
    }
    for i in right{
        print(i,terminator: "")
    }
}

