//
//  10814.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/23.
//

import Foundation

struct Judge {
    let name : String
    let age : Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

func solution10814() {
    let n : Int = Int(readLine()!)!
    var humans : [Judge] = []
    for _ in 0...n-1 {
        let prob = readLine()!.components(separatedBy: " ")
        humans.append(Judge(name: prob[1], age: Int(prob[0])!))
    }
    
    let answer = humans.sorted(by: {$0.age < $1.age})
    
    for i in 0...answer.count-1 {
        print("\(answer[i].age) \(answer[i].name)")
    }
    
}
