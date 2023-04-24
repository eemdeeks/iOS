//
//  1427.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/23.
//

import Foundation

func solution1427() {
    let input = readLine()!.split(separator: "").map({Int(String($0))!})
    for i in input.sorted(by: {$0 > $1}){
        print(i,terminator: "")
    }
}
