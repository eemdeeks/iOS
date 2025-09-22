//
//  10989.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/05/06.
//

import Foundation

func solution10989() {
    let n : Int = Int(readLine()!)!
    var arr : [Int] = []
    for _ in 0..<n {
        arr.append(Int(readLine()!)!)
    }
    print(arr.sorted().map{String($0)}.joined(separator: "\n"))
}
