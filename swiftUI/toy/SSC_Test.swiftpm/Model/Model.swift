//
//  Model.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/07.
//

import Foundation

struct Model: Identifiable{
    let text: [Text]
    var index : Int
    var answer : Answer
    var problem : String
    let imageKey : [ImageKey]
    var level : Int
    var id: String { problem }
    
    init(text: [Text], index: Int = 0, answer: Answer, problem: String, imageKey : [ImageKey],level : Int = 0) {
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
    final class Answer : Identifiable {
        let answerArray : [String]
        let answerString : String
        
        init(answerArray: [String], answerString: String) {
            self.answerArray = answerArray
            self.answerString = answerString
        }
    }
    final class ImageKey : Identifiable {
        var key : [String]
        var btnKey : [String]
        
        init(key: [String], btnKey: [String] = []) {
            self.key = key
            self.btnKey = btnKey
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
        answer: .init(answerArray: ["ㅇ","ㅣ","ㅇ","ㅑ","ㄱ","ㅣ"], answerString: "이야기"),
        problem: "Story",
        imageKey: [
        .init(key: ["textField","textField","textField","textField","textField","textField"],
             btnKey: ["blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"],
              btnKey: ["blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank",
                      "blank","blank"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    static let banana = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["ㅂ","ㅏ","ㄴ","ㅏ","ㄴ","ㅏ"], answerString: "바나나"),
        problem: "Banana",
        imageKey: [
        .init(key: ["textField","textField","textField","textField","textField","textField"],
             btnKey: ["blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"],
              btnKey: ["blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank",
                      "blank","blank"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    static let joke = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["ㄴ","ㅗ","ㅇ","ㄷ","ㅏ","ㅁ"], answerString: "농담"),
        problem: "Joke",
        imageKey: [
        .init(key: ["textField","textField","textField","textField","textField","textField"],
             btnKey: ["blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"],
              btnKey: ["blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank",
                      "blank","blank"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    static let emotion = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["ㄱ","ㅏ","ㅁ","ㅈ","ㅓ","ㅇ"], answerString: "감정"),
        problem: "Emotion",
        imageKey: [
        .init(key: ["textField","textField","textField","textField","textField","textField"],
             btnKey: ["blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"],
              btnKey: ["blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank","blank",
                      "blank","blank"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"]),
        .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    static let modelList : [Model] = [.story,.banana,.joke,.emotion]
}
