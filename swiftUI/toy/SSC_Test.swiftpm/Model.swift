//
//  Model.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/07.
//

import Foundation

struct Model{
    let text: [Text]
    var index : Int
    var answer : [String]
    var problem : String
    let imageKey : [ImageKey]
    var level : Int
    
    init(text: [Text], index: Int = 0, answer: [String],problem: String, imageKey : [ImageKey],level : Int = 0) {
        self.text = text
        self.index = index
        self.answer = answer
        self.problem = problem
        self.imageKey = imageKey
        self.level = level
    }
}

extension Model {
    final class Text : Identifiable {
        var text : [String]
        init(text: [String]) {
            self.text = text
        }
    }
    final class ImageKey : Identifiable {
        var key : [String]
        init(key: [String]) {
            self.key = key
        }
        
    }
    
    static let story = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: ["ㅇ","ㅣ","ㅇ","ㅑ","ㄱ","ㅣ"],
        problem: "Story",
        imageKey: [
        .init(key: ["blank","blank","blank","blank","blank","blank"]),
        .init(key: ["blank","blank","blank","blank","blank","blank"]),
        .init(key: ["blank","blank","blank","blank","blank","blank"]),
        .init(key: ["blank","blank","blank","blank","blank","blank"]),
        .init(key: ["blank","blank","blank","blank","blank","blank"])
        ]
        
    )
}
