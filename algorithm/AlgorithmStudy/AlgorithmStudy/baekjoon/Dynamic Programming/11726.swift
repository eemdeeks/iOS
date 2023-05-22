//
//  11726.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/05/22.
//

import Foundation

func solution11726() {
    guard let n: Int = Int(readLine() ?? "0") else {return}
    var memo: [Int] = [1,2]
    
    guard n != 1 else {
        print(1)
        return
    }
    guard n != 2 else {
        print(2)
        return
    }
    for i in 2..<n{
        memo.append((memo[i-1]+memo[i-2])%10007)
    }
    print(memo[n-1])
}
