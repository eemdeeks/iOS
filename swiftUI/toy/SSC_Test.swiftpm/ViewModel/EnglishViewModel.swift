//
//  EnglishViewModel.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/11.
//

import Foundation

class EnglishViewModel : ObservableObject {
    @Published var myAnswer: Model
    @Published var answerBool: Bool
    @Published var wrongBool: Bool
    
    init(myAnswer: Model, answerBool: Bool = false, wrongBool: Bool = false){
        self.myAnswer = myAnswer
        self.answerBool = answerBool
        self.wrongBool = wrongBool
    }
    func inputEnglish(text: String){
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
        case "a" : isCorrect(index: 10)
        case "b" : isCorrect(index: 23)
        case "c" : isCorrect(index: 21)
        case "d" : isCorrect(index: 12)
        case "e" : isCorrect(index: 2)
        case "f" : isCorrect(index: 13)
        case "g" : isCorrect(index: 14)
        case "h" : isCorrect(index: 15)
        case "i" : isCorrect(index: 7)
        case "j" : isCorrect(index: 16)
        case "k" : isCorrect(index: 17)
        case "l" : isCorrect(index: 18)
        case "m" : isCorrect(index: 25)
        case "n" : isCorrect(index: 24)
        case "o" : isCorrect(index: 8)
        case "p" : isCorrect(index: 9)
        case "q" : isCorrect(index: 0)
        case "r" : isCorrect(index: 3)
        case "s" : isCorrect(index: 11)
        case "t" : isCorrect(index: 4)
        case "u" : isCorrect(index: 6)
        case "v" : isCorrect(index: 22)
        case "w" : isCorrect(index: 1)
        case "x" : isCorrect(index: 20)
        case "y" : isCorrect(index: 5)
        case "z" : isCorrect(index: 19)
        default:
            print("문제있음")
        }
    }
    func changeBtnSimilar(text : String) {
        switch text {
        case "a" : isSimilar(index: 10)
        case "b" : isSimilar(index: 23)
        case "c" : isSimilar(index: 21)
        case "d" : isSimilar(index: 12)
        case "e" : isSimilar(index: 2)
        case "f" : isSimilar(index: 13)
        case "g" : isSimilar(index: 14)
        case "h" : isSimilar(index: 15)
        case "i" : isSimilar(index: 7)
        case "j" : isSimilar(index: 16)
        case "k" : isSimilar(index: 17)
        case "l" : isSimilar(index: 18)
        case "m" : isSimilar(index: 25)
        case "n" : isSimilar(index: 24)
        case "o" : isSimilar(index: 8)
        case "p" : isSimilar(index: 9)
        case "q" : isSimilar(index: 0)
        case "r" : isSimilar(index: 3)
        case "s" : isSimilar(index: 11)
        case "t" : isSimilar(index: 4)
        case "u" : isSimilar(index: 6)
        case "v" : isSimilar(index: 22)
        case "w" : isSimilar(index: 1)
        case "x" : isSimilar(index: 20)
        case "y" : isSimilar(index: 5)
        case "z" : isSimilar(index: 19)
        default:
            print("문제있음")
        }
    }
    func changeBtnWrong(text : String) {
        switch text {
        case "a" : isWrong(index: 10)
        case "b" : isWrong(index: 23)
        case "c" : isWrong(index: 21)
        case "d" : isWrong(index: 12)
        case "e" : isWrong(index: 2)
        case "f" : isWrong(index: 13)
        case "g" : isWrong(index: 14)
        case "h" : isWrong(index: 15)
        case "i" : isWrong(index: 7)
        case "j" : isWrong(index: 16)
        case "k" : isWrong(index: 17)
        case "l" : isWrong(index: 18)
        case "m" : isWrong(index: 25)
        case "n" : isWrong(index: 24)
        case "o" : isWrong(index: 8)
        case "p" : isWrong(index: 9)
        case "q" : isWrong(index: 0)
        case "r" : isWrong(index: 3)
        case "s" : isWrong(index: 11)
        case "t" : isWrong(index: 4)
        case "u" : isWrong(index: 6)
        case "v" : isWrong(index: 22)
        case "w" : isWrong(index: 1)
        case "x" : isWrong(index: 20)
        case "y" : isWrong(index: 5)
        case "z" : isWrong(index: 19)
        default:
            print("문제있음")
        }
    }
    
    func isCorrect(index : Int){
        if self.myAnswer.imageKey[1].btnKey[index] != "correctBoard"{
            self.myAnswer.imageKey[1].btnKey[index] = "correctBoard"
        }
    }
    func isSimilar(index : Int){
        if self.myAnswer.imageKey[1].btnKey[index] != "correctBoard" {
            self.myAnswer.imageKey[1].btnKey[index] = "similarBoard"
        }
    }
    func isWrong(index : Int) {
        if self.myAnswer.imageKey[1].btnKey[index] == "keyboard" {
            self.myAnswer.imageKey[1].btnKey[index] = "wrongBoard"
        }
    }
    
    // MARK: - 리프레쉬 버튼
    func refreshBtn() {
        for i in 0...self.myAnswer.level{
            if i == 5 { break }
            for j in 0...self.myAnswer.text[i].text.count-1{
                self.myAnswer.text[i].text[j] = ""
                self.myAnswer.imageKey[i].key[j] = "textField"
            }
        }
        for i in 0...self.myAnswer.imageKey[1].btnKey.count-1 {
            self.myAnswer.imageKey[1].btnKey[i] = "keyboard"
        }
        
        self.myAnswer.isSolved = false
        self.myAnswer.level = 0
        self.myAnswer.index = 0
    }
}
