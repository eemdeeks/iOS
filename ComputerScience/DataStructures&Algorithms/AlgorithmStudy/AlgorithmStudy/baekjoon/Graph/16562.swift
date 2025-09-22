//
//  16562.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/10/24.
//

import Foundation

func friendPrice() {
    guard let inputFirstLine = readLine() else { return }
    guard let inputSecondLine = readLine() else { return }
    let NMK = inputFirstLine.components(separatedBy: " ").map{ Int($0) ?? 0}
    let friendPrice: [Int] = inputSecondLine.components(separatedBy: " ").map{Int($0) ?? 0}
    var relationsip: [[Int]] = Array(repeating: [Int](), count: NMK[0])
    var isFriend: [Bool] = Array(repeating: false, count: NMK[0])
    var totalPrice: Int = 0

    for _ in 0..<NMK[1] {
        guard let input = readLine() else { return }
        let relation = input.components(separatedBy: " ").map { Int($0) ?? 0 }
        relationsip[relation[0]-1].append(relation[1]-1)
        relationsip[relation[1]-1].append(relation[0]-1)
    }

    for index in 0..<NMK[0] {
        if !isFriend[index] {
            totalPrice += dfs(index, &isFriend, relationsip, friendPrice)
        }
    }

    if totalPrice > NMK[2] {
        print("Oh no")
    } else {
        print(totalPrice)
    }
}

func dfs(_ friendNum: Int, _ isFriend: inout [Bool], _ relationShip: [[Int]], _ friendPrice: [Int]) -> Int {
    var minPrice: Int = 10001
    var needVisit: Set<Int> = [friendNum]
    var isVisited: [Bool] = Array(repeating: false, count: isFriend.count)

    while !needVisit.isEmpty {
        let friend = needVisit.removeFirst()
        isFriend[friend] = true
        isVisited[friend] = true
        if minPrice > friendPrice[friend] {
            minPrice = friendPrice[friend]
        }

        for index in relationShip[friend] {
            if !isVisited[index] {
                needVisit.insert(index)
            }
        }
    }

    return minPrice
}
