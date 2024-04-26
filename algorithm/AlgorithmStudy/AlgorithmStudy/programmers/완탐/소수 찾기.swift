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
    var primeArray: [Bool] = []
    var sol: Int = 0
    for i in 1...numbers.count {
        answer = answer.union(permutation(arr, i))
    }
    print(answer)

    primeArray = prime(answer.max()!)
    for i in answer where primeArray[i] {
        sol += 1
    }
    print(primeArray)
    print(sol)
    return sol
}

func prime(_ max: Int) -> [Bool] {
    var prime: [Bool] = Array(repeating: true, count: max + 1)
    prime[0] = false
    prime[1] = false

    for i in 2...Int(sqrt(Double(max))) {
        if prime[i] == true {
            for j in i...max {
                if j == i {
                    continue
                }
                if j % i == 0 {
                    prime[j] = false
                } else {
                    continue
                }
            }
        } else {
            continue
        }
    }
    return prime
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
