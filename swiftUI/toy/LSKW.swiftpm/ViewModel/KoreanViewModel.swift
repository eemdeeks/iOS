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
            if self.myAnswer.index < self.myAnswer.answer.answerArray.count {
                self.myAnswer.text[self.myAnswer.level].text[self.myAnswer.index] = text
                self.myAnswer.index += 1
            }
        }
    }
    // MARK: - 텍스트 clean (쓰고 있는 인덱스 모두 지우기)
    func cleanText(){
        if self.myAnswer.level < 5{
            for i in 0...self.myAnswer.answer.answerArray.count-1{
                self.myAnswer.text[self.myAnswer.level].text[i] = ""
            }
            self.myAnswer.index = 0
        }
    }
    // MARK: - 텍스트 delete (한글자만 지우기)
    func deleteText(){
        if self.myAnswer.level < 5 && self.myAnswer.index > 0{
            self.myAnswer.text[self.myAnswer.level].text[self.myAnswer.index-1] = ""
            self.myAnswer.index -= 1
        }
    }
    func compareAnswer(){
        if self.myAnswer.level < 5 {
            var count = 0
            if self.myAnswer.text[self.myAnswer.level].text[self.myAnswer.answer.answerArray.count-1] == ""{
                print("답 확인 불가")
            } else {
                for i in 0...self.myAnswer.answer.answerArray.count-1{
                    if self.myAnswer.text[self.myAnswer.level].text[i] == self.myAnswer.answer.answerArray[i]{
                        self.myAnswer.imageKey[self.myAnswer.level].key[i] = "correct"
                        changeBtnCorrect(text: self.myAnswer.text[self.myAnswer.level].text[i])
                        count += 1
                    }else if self.myAnswer.answer.answerArray.contains(self.myAnswer.text[self.myAnswer.level].text[i]){
                        self.myAnswer.imageKey[self.myAnswer.level].key[i] = "similar"
                        changeBtnSimilar(text: self.myAnswer.text[self.myAnswer.level].text[i])
                    }else {
                        self.myAnswer.imageKey[self.myAnswer.level].key[i] = "wrong"
                        changeBtnWrong(text: self.myAnswer.text[self.myAnswer.level].text[i])
                    }
                    
                }
                if count == self.myAnswer.answer.answerArray.count {
                    self.answerBool = true
                    self.myAnswer.level = 5
                    self.myAnswer.isSolved = true
                }else if self.myAnswer.level == 4{
                    self.wrongBool = true
                }
                self.myAnswer.level += 1
                self.myAnswer.index = 0
            }
        }
        
    }
    
    func changeBtnCorrect(text : String) {
        switch text {
        case "ㄱ" : isCorrect(index: 3)
        case "ㄴ" : isCorrect(index: 9)
        case "ㄷ" : isCorrect(index: 2)
        case "ㄹ" : isCorrect(index: 11)
        case "ㅁ" : isCorrect(index: 8)
        case "ㅂ" : isCorrect(index: 0)
        case "ㅅ" : isCorrect(index: 4)
        case "ㅇ" : isCorrect(index: 10)
        case "ㅈ" : isCorrect(index: 1)
        case "ㅊ" : isCorrect(index: 19)
        case "ㅋ" : isCorrect(index: 17)
        case "ㅌ" : isCorrect(index: 18)
        case "ㅍ" : isCorrect(index: 20)
        case "ㅎ" : isCorrect(index: 12)
        case "ㅏ" : isCorrect(index: 15)
        case "ㅑ" : isCorrect(index: 7)
        case "ㅓ" : isCorrect(index: 14)
        case "ㅕ" : isCorrect(index: 6)
        case "ㅗ" : isCorrect(index: 13)
        case "ㅛ" : isCorrect(index: 5)
        case "ㅜ" : isCorrect(index: 22)
        case "ㅠ" : isCorrect(index: 21)
        case "ㅡ" : isCorrect(index: 23)
        case "ㅣ" : isCorrect(index: 16)
        default:
            print("문제있음")
        }
    }
    func changeBtnSimilar(text : String) {
        switch text {
        case "ㄱ" : isSimilar(index: 3)
        case "ㄴ" : isSimilar(index: 9)
        case "ㄷ" : isSimilar(index: 2)
        case "ㄹ" : isSimilar(index: 11)
        case "ㅁ" : isSimilar(index: 8)
        case "ㅂ" : isSimilar(index: 0)
        case "ㅅ" : isSimilar(index: 4)
        case "ㅇ" : isSimilar(index: 10)
        case "ㅈ" : isSimilar(index: 1)
        case "ㅊ" : isSimilar(index: 19)
        case "ㅋ" : isSimilar(index: 17)
        case "ㅌ" : isSimilar(index: 18)
        case "ㅍ" : isSimilar(index: 20)
        case "ㅎ" : isSimilar(index: 12)
        case "ㅏ" : isSimilar(index: 15)
        case "ㅑ" : isSimilar(index: 7)
        case "ㅓ" : isSimilar(index: 14)
        case "ㅕ" : isSimilar(index: 6)
        case "ㅗ" : isSimilar(index: 13)
        case "ㅛ" : isSimilar(index: 5)
        case "ㅜ" : isSimilar(index: 22)
        case "ㅠ" : isSimilar(index: 21)
        case "ㅡ" : isSimilar(index: 23)
        case "ㅣ" : isSimilar(index: 16)
        default:
            print("문제있음")
        }
    }
    func changeBtnWrong(text : String) {
        switch text {
        case "ㄱ" : isWrong(index: 3)
        case "ㄴ" : isWrong(index: 9)
        case "ㄷ" : isWrong(index: 2)
        case "ㄹ" : isWrong(index: 11)
        case "ㅁ" : isWrong(index: 8)
        case "ㅂ" : isWrong(index: 0)
        case "ㅅ" : isWrong(index: 4)
        case "ㅇ" : isWrong(index: 10)
        case "ㅈ" : isWrong(index: 1)
        case "ㅊ" : isWrong(index: 19)
        case "ㅋ" : isWrong(index: 17)
        case "ㅌ" : isWrong(index: 18)
        case "ㅍ" : isWrong(index: 20)
        case "ㅎ" : isWrong(index: 12)
        case "ㅏ" : isWrong(index: 15)
        case "ㅑ" : isWrong(index: 7)
        case "ㅓ" : isWrong(index: 14)
        case "ㅕ" : isWrong(index: 6)
        case "ㅗ" : isWrong(index: 13)
        case "ㅛ" : isWrong(index: 5)
        case "ㅜ" : isWrong(index: 22)
        case "ㅠ" : isWrong(index: 21)
        case "ㅡ" : isWrong(index: 23)
        case "ㅣ" : isWrong(index: 16)
        default:
            print("문제있음")
        }
    }
    
    func isCorrect(index : Int){
        if self.myAnswer.imageKey[0].btnKey[index] != "correctBoard"{
            self.myAnswer.imageKey[0].btnKey[index] = "correctBoard"
        }
    }
    func isSimilar(index : Int){
        if self.myAnswer.imageKey[0].btnKey[index] != "correctBoard" {
            self.myAnswer.imageKey[0].btnKey[index] = "similarBoard"
        }
    }
    func isWrong(index : Int) {
        if self.myAnswer.imageKey[0].btnKey[index] == "keyboard" {
            self.myAnswer.imageKey[0].btnKey[index] = "wrongBoard"
        }
    }
    
    func refreshBtn() {
        for i in 0...self.myAnswer.level{
            if i == 5 { break }
            for j in 0...self.myAnswer.text[i].text.count-1{
                self.myAnswer.text[i].text[j] = ""
                self.myAnswer.imageKey[i].key[j] = "textField"
            }
        }
        for i in 0...self.myAnswer.imageKey[0].btnKey.count-1 {
            self.myAnswer.imageKey[0].btnKey[i] = "keyboard"
        }
        
        self.myAnswer.isSolved = false
        self.myAnswer.level = 0
        self.myAnswer.index = 0
    }
    
}
