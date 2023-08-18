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
    var isSolved : Bool
    
    init(text: [Text], index: Int = 0, answer: Answer, problem: String, imageKey : [ImageKey],level : Int = 0, isSolved: Bool = false) {
        self.text = text
        self.index = index
        self.answer = answer
        self.problem = problem
        self.imageKey = imageKey
        self.level = level
        self.isSolved = isSolved
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
    // MARK: - 영어를 한글로 (문제)
    static let cliff = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["ㅈ","ㅓ","ㄹ","ㅂ","ㅕ","ㄱ"], answerString: "절벽"),
        problem: "Cliff",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let decoration = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["ㅈ","ㅏ","ㅇ","ㅅ","ㅣ","ㄱ"], answerString: "장식"),
        problem: "Decoration",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let basket = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["ㅂ","ㅏ","ㄱ","ㅜ","ㄴ","ㅣ"], answerString: "바구니"),
        problem: "Basket",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
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
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
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
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
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
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
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
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let blank = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["ㅂ","ㅣ","ㄴ","ㅋ","ㅏ","ㄴ"], answerString: "빈칸"),
        problem: "Blank",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let pig = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["ㄷ","ㅗ","ㅏ","ㅣ","ㅈ","ㅣ"], answerString: "돼지"),
        problem: "Pig",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let exercise = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["ㅇ","ㅜ","ㄴ","ㄷ","ㅗ","ㅇ"], answerString: "운동"),
        problem: "Exercise",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )

    static let modelList : [Model] = [.cliff,.blank,.decoration,.basket,.story,.banana,.joke,.emotion,.exercise, .pig]
    
    
    // MARK: - 한글을 영어로 (문제)
    
    static let office = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["o","f","f","i","c","e"], answerString: "office"),
        problem: "사무실",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let season = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["s","e","a","s","o","n"], answerString: "season"),
        problem: "계절",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let spring = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["s","p","r","i","n","g"], answerString: "spring"),
        problem: "봄",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let summer = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["s","u","m","m","e","r"], answerString: "summer"),
        problem: "여름",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    static let winter = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["w","i","n","t","e","r"], answerString: "winter"),
        problem: "겨울",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let rabbit = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["r","a","b","b","i","t"], answerString: "rabbit"),
        problem: "토끼",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let change = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["c","h","a","n","g","e"], answerString: "change"),
        problem: "변하다, 바꾸다",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let invite = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["i","n","v","i","t","e"], answerString: "invite"),
        problem: "초대하다",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let dinner = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["d","i","n","n","e","r"], answerString: "dinner"),
        problem: "저녁식사",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let shadow = Model(
        text: [
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""]),
            .init(text: ["","","","","",""])
        ],
        answer: .init(answerArray: ["s","h","a","d","o","w"], answerString: "shadow"),
        problem: "그림자",
        imageKey: [
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"],
                  btnKey: ["keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard","keyboard",
                           "keyboard","keyboard"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"]),
            .init(key: ["textField","textField","textField","textField","textField","textField"])
        ]
        
    )
    
    static let modelList2 : [Model] = [.office,.season,.spring,.summer,.winter,.rabbit,.change,.shadow,.invite, .dinner]
}
