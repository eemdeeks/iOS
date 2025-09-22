//
//  9095.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/05/26.
//

import Foundation

func solution9095() {
    guard let T: Int = Int(readLine() ?? "0") else { return }
    
    var answer: [Int] = [1,2,4]
    
    for i in 3...11{
        answer.append(answer[i-1]+answer[i-2]+answer[i-3])
    }
    
    for _ in 0..<T {
        guard let n: Int = Int(readLine() ?? "0") else {return}
        
        print(answer[n-1])
    }
}
