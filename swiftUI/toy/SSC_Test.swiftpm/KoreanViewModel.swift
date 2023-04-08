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
}
