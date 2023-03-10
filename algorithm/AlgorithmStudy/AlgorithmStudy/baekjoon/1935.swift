//
//  1935.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/09.
//

import Foundation

func solution1935(){
    let op : [String] = ["+","-","*","/"]
    var al : [Int] = []
    var oper : [String] = []
    var num : [Int] = []
    
    var answer : Int = 0
    
    var N = Int(readLine()!)!
    var prob = Array(readLine()!)
    for i in 1...N{
        num.append(Int(readLine()!)!)
    }
    for i in prob{
        if op.contains(String(i)) {
            oper.append(String(i))
        }else{
            al.append(num[Int(Unicode.Scalar(String(i))!.value)-65])
        }
    }
    
    for i in oper{
        if i == "+"{
            answer = al[al.count-1] + al[al.count-2]
            al.remove(at: al.count-1)
            al.remove(at: al.count-1)
            al.append(answer)
        }else if i == "-" {
            answer = al[al.count-1] - al[al.count-2]
            al.remove(at: al.count-1)
            al.remove(at: al.count-1)
            al.append(answer)
        }else if i == "*"{
            answer = al[al.count-1] * al[al.count-2]
            al.remove(at: al.count-1)
            al.remove(at: al.count-1)
            al.append(answer)
        }else{ // 나누기
            answer = al[al.count-1] / al[al.count-2]
            al.remove(at: al.count-1)
            al.remove(at: al.count-1)
            al.append(answer)
        }
    }
    
    print(answer)
    
}
