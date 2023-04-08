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
    func inputKorean(text: String,index: Int){
        self.myAnswer.text[index] = text
        print("뷰모델에 들어감")
    }
}
