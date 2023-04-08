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
}
