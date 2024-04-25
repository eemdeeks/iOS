//
//  소수 찾기.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/25/24.
//

import Foundation

func sosu(_ numbers:String) -> Int {
    var arr: [String] = numbers.map{ String($0) }
    var answer: Set<Int> = []
    for i in 1...numbers.count {
        answer = answer.union(permutation(arr, i))
    }
    print(answer)
    return 0
}

func permutation(_ numbers: [String], _ count: Int) -> Set<Int> {
    var sol: Set<Int> = []
    var visited = Array(repeating: false, count: numbers.count)

    func perm(_ str: String) {
        if str.count == count {
            sol.insert(Int(str)!)
            return
        }

        for i in 0..<numbers.count {
            if visited[i] { continue }
            visited[i] = true
            perm(str + numbers[i])
            visited[i] = false
        }
    }
    
    perm("")
    return sol
}
