//
//  KoreanViewModel.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/07.
//

import Foundation

class KoreanViewModel : ObservableObject {
    @Published var myAnswer: Model
    @Published var answerBool: Bool
    @Published var wrongBool: Bool
    
    init(myAnswer: Model, answerBool: Bool = false, wrongBool: Bool = false){
        self.myAnswer = myAnswer
        self.answerBool = answerBool
        self.wrongBool = wrongBool
    }
    func inputKorean(text: String){
        if self.myAnswer.level < 5{
            if self.myAnswer.index < self.myAnswer.answer.count {
                self.myAnswer.text[self.myAnswer.level].text[self.myAnswer.index] = text
                self.myAnswer.index += 1
            }
        }
    }
    func deleteAnswer(){
        if self.myAnswer.level < 5{
            for i in 0...self.myAnswer.answer.count-1{
                self.myAnswer.text[self.myAnswer.level].text[i] = ""
            }
            self.myAnswer.index = 0
        }
    }
    func compareAnswer(){
        if self.myAnswer.level < 5 {
            var count = 0
            if self.myAnswer.text[self.myAnswer.level].text[self.myAnswer.answer.count-1] == ""{
                print("답 확인 불가")
            } else {
                for i in 0...self.myAnswer.answer.count-1{
                    if self.myAnswer.text[self.myAnswer.level].text[i] == self.myAnswer.answer[i]{
                        self.myAnswer.imageKey[self.myAnswer.level].key[i] = "correct"
                        count += 1
                    }else if self.myAnswer.answer.contains(self.myAnswer.text[self.myAnswer.level].text[i]){
                        self.myAnswer.imageKey[self.myAnswer.level].key[i] = "similar"
                    }else {
                        self.myAnswer.imageKey[self.myAnswer.level].key[i] = "wrong"
                    }
                    
                }
                if count == self.myAnswer.answer.count {
                    self.answerBool = true
                }else if self.myAnswer.level == 4{
                    self.wrongBool = true
                }
                self.myAnswer.level += 1
                self.myAnswer.index = 0
            }
        }
        
    }
}
