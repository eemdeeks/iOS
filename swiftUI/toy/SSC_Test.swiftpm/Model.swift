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
    var imageKey : [String]
    
    init(text: [String] = ["","","","","","","","","","","","","","","","","",""], index: Int = 0, answer: [String], imageKey : [String] = ["blank","blank","blank","blank","blank","blank"]) {
        self.text = text
        self.index = index
        self.answer = answer
        self.imageKey = imageKey
    }
}

extension Model {
    static let story = Model(answer: ["ㅇ","ㅣ","ㅇ","ㅑ","ㄱ","ㅣ"])
}
