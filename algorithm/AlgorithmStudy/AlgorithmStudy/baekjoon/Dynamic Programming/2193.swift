//
//  2193.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/05/30.
//

import Foundation

func solution2193() {
    guard let n: Int = Int(readLine() ?? "0") else { return }
    var cache: [Int] = [0,1,1]
    guard n != 1 else {
        print(cache[1])
        return
    }
    guard n != 2 else {
        print(cache[2])
        return
    }
    for i in 3...n{
        cache.append(cache[i-1]+cache[i-2])
    }
    print(cache[n])
}
