//
//  solution3.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/25/23.
//

import Foundation

func solution4(_ coin:Int, _ cards:[Int]) -> Int {
    return 0
}



func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    func cycle(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }

    cycle(0, [])

    return result
}
