//
//  모음 사전.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/30/24.
//

import Foundation

/*
 "AAAAE" -> 6
 "AAAE" -> 10
 "I" -> 1563
 "EIO" -> 1189
 */
func modict(_ word:String) -> Int {
    var answer: Int = 0
    let chars: [String] = ["A","E","I","O","U"]
    var flag: Bool = false
    func makeWord(_ str: String) {
        if str == word {
            flag = true
            return
        } else if str.count == 5 { return }
        for char in chars {
            answer += 1
            makeWord(str+char)
            if flag { return }
        }
    }
    makeWord("")
    return answer
}
