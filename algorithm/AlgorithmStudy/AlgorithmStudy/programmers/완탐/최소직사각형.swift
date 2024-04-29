//
//  최소직사각형.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/29/24.
//

import Foundation

func card(_ sizes:[[Int]]) -> Int {
    let array = sizes.map {
        if $0[0] > $0[1] { [$0[1], $0[0]] } else { $0 }
    }
    var height: Int = 0
    var width: Int = 0

    for i in array {
        if height < i[0] { height = i[0] }
        if width < i[1] { width = i[1] }
    }
    
    return height * width
}
