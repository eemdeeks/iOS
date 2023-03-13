//
//  9012.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/09.
//

import Foundation

func solution9012(n : Int){
    for i in 1...n{
        var stack : [Int] = []
        var prob = Array(readLine()!)
        var flag = true
        for j in prob{
            if j == "("{
                stack.append(0)
            }else {
                if stack.isEmpty{
                    print("NO")
                    flag = false
                    break
                }else {
                    stack.remove(at: stack.count-1)
                }
            }
            
        }
        if flag {
            if stack.isEmpty {
                print("YES")
            }else{
                
                print("NO")
            }
        }
    }
    
}
