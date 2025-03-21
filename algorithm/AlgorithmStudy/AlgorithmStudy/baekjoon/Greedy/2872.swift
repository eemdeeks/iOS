//
//  2872.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/07/04.
//

import Foundation

func solution2872() {
    var n: Int = Int(readLine()!)!
    var books: [Int] = []
    var answer: Int = 0
    for _ in 0..<n {
        books.append(Int(readLine()!)!)
    }
    for index in (0..<n).reversed(){
        if n == books[index] {
            n -= 1
        } else {
            answer += 1
        }
    }
    print(answer)
}
