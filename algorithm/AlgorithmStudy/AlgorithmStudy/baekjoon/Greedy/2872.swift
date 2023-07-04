//
//  2872.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/07/04.
//

import Foundation

func solution2872() {
    let n: Int = Int(readLine()!)!
    var books: [Int] = []
    for _ in 0..<n {
        books.append(Int(readLine()!)!)
    }
    var answer: [Int] = []
    var booksMaxIndex: Int = books.firstIndex(of: books.max()!)!
    
    while booksMaxIndex == books.count-1 {
        books.removeLast()
        if books.isEmpty {
            print(0)
            return
        }
        booksMaxIndex = books.firstIndex(of: books.max()!)!
    }
    guard booksMaxIndex != 0 else {
        print(books.count-1)
        return
    }
    
    for i in booksMaxIndex+1..<books.count {
        answer.append(books[i])
    }
    let answerMax: Int = answer.max()!
    for i in 0..<booksMaxIndex {
        if books[i] < answerMax {
            answer.append(books[i])
        }
    }
    print(answer.count)
    
}
