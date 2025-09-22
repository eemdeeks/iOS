//
//  1182.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/15.
//

import Foundation

func solution1182(){
    let n : [Int] = readLine()!.split(separator: " ").map{
        Int(String($0))!
    }
    let S : [Int] = readLine()!.split(separator: " ").map{
        Int(String($0))!
    }
    var answer : Int = 0
    var visited: [Bool] = Array(repeating: false, count: S.count)

    func comb(arr: [Int], _ count: Int, index: Int) {
        if arr.count == count {
            if arr.reduce(0, +) == n[1] { answer += 1 }
            return
        }
        for i in index..<S.count {
            if visited[i] { continue }
            visited[i] = true
            comb(arr: arr + [S[i]], count, index: i+1)
            visited[i] = false
        }
    }

    for i in 1...n[0] {
        comb(arr: [], i, index: 0)
    }
    print(answer)
}
