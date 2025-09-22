//
//  올바른괄호.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/23.
//

import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    var list : [String] = []
    for i in s{
        if i == "("{
            list.append("(")
        } else {
            if list.isEmpty {
                return ans
            } else {
                list.removeLast()
            }
        }
    }
    if list.isEmpty {
        ans = true
    }
    return ans
}

