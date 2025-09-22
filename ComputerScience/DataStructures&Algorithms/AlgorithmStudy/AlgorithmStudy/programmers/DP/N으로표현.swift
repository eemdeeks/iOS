//
//  N으로표현.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2/6/24.
//

import Foundation

import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    if N == number {
        return 1
    }
    var cache: [Set<Int>] = [[],[N]]
    var new: Set<Int> = []
    new.insert(N*11)
    new.insert(N+N)
    new.insert(N-N)
    new.insert(N*N)
    new.insert(N/N)
    if new.contains(number) {
        return 2
    }

    cache.append(new)
    var num: String = "\(N)\(N)"
    for i in 3...8 {
        var list: Set<Int> = []
        num += "\(N)"
        list.insert(Int(num)!)
        print(num)
        for j in 1..<i {
            for element in cache[j] {
                for element1 in cache[i-j] {
                    list.insert(element + element1)
                    list.insert(element - element1)
                    if element1 != 0 { list.insert(element / element1) }
                    list.insert(element * element1)
                }
            }
        }
        if list.contains(number) {
            return i
        } else {
            cache.append(list)
        }
    }

    return -1
}
