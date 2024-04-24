//
//  2.2.swift
//  AlgorithmStudy
//  우박수열 정적분(콜라츠 추측)
//  Created by 박승찬 on 4/24/24.
//

import Foundation

func level2_2(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var root: Int = k
    var y: [Double] = [Double(k)]
    var integral: [Double] = []
    var result: [Double] = []
    while root != 1 {
        if root % 2 == 0 {
            root /= 2
        } else {
            root *= 3
            root += 1
        }
        y.append(Double(root))
    }
    print(y)

    var frontY: Double = Double(k)

    for pointX in 1..<y.count {
        var sol = 0.0
        var backY = y[pointX]
        if frontY > backY {
            sol = (frontY - backY)/2 + backY
        } else {
            sol = (backY - frontY)/2 + frontY
        }
        integral.append(sol)
        frontY = backY
    }
    print(integral)

    var n = y.count - 1
    print(n)

    for range in ranges {
        if range[1] < 1 {
            if range[0] > n+range[1] {
                result.append(-1.0)
            }else {
                result.append(
                    integral[range[0]..<(n+range[1])]
                        .reduce(0, +)
                )
            }
        } else {
            if range[0] > range[1] {
                result.append(-1.0)
            }else {
                result.append(
                    integral[range[0]..<range[1]]
                        .reduce(0, +)
                )
            }
        }
    }
    return result
}
