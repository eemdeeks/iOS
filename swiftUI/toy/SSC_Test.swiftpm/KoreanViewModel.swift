//
//  KoreanViewModel.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/07.
//

import Foundation

class KoreanViewModel : ObservableObject {
    @Published var myAnswer: Model
    
    init(myAnswer: Model){
        self.myAnswer = myAnswer
    }
    func inputKorean(text: String){
        if self.myAnswer.index < self.myAnswer.answer.count {
            self.myAnswer.text[self.myAnswer.index] = text
            self.myAnswer.index += 1
        }
    }
    func deleteAnswer(){
        for i in 0...self.myAnswer.text.count-1{
            self.myAnswer.text[i] = ""
        }
        self.myAnswer.index = 0
    }
    func compareAnswer(){
        if self.myAnswer.text[self.myAnswer.answer.count-1] == ""{
            print("답 확인 불가")
        } else {
            for i in 0...self.myAnswer.answer.count-1{
                if self.myAnswer.text[i] == self.myAnswer.answer[i]{
                    self.myAnswer.imageKey[i] = "correct"
                }else if self.myAnswer.answer.contains(self.myAnswer.text[i]){
                    self.myAnswer.imageKey[i] = "similar"
                }else {
                    self.myAnswer.imageKey[i] = "wrong"
                }
                
            }
        }
    }
}
