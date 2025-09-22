//
//  1413.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/30.
//

import Foundation

func solution1431() {
    let n : Int = Int(readLine()!)!
    var prob : [String] = []
    for _ in 0..<n {
        prob.append(readLine()!)
    }
    
    //3번
    prob.sort()
    
    //2번
    for i in prob {
        
    }
    //1번
    prob.sort(by: {$0.count < $1.count})
    
    print(prob)
}
