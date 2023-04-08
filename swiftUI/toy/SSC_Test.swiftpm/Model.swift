//
//  Model.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/07.
//

import Foundation

struct Model{
    var text: [String]
    var index : Int
    var answer : [String]
    
    init(text: [String] = ["","","","","","","","","","","","","","","","","",""], index: Int = 0, answer: [String]) {
        self.text = text
        self.index = index
        self.answer = answer
    }
}

extension Model {
    static let story = Model(answer: ["ㅇ","ㅣ","ㅇ","ㅑ","ㄱ","ㅣ"])
}
