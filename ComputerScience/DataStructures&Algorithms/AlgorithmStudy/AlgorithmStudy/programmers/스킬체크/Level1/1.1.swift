//
//  1.1.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/23/24.
//

import Foundation

func level1_1(_ arr:[Int]) -> Double {
    return arr.map{ Double($0)}.reduce(0, +) / Double(arr.count)
}
