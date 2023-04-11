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
    func deleteAnswer(){
        if self.myAnswer.level < 5{
            for i in 0...self.myAnswer.answer.answerArray.count-1{
                self.myAnswer.text[self.myAnswer.level].text[i] = ""
            }
            self.myAnswer.index = 0
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
        case "a" : isCorrect(index: 0)
        case "b" : isCorrect(index: 1)
        case "c" : isCorrect(index: 2)
        case "d" : isCorrect(index: 3)
        case "e" : isCorrect(index: 4)
        case "f" : isCorrect(index: 5)
        case "g" : isCorrect(index: 6)
        case "h" : isCorrect(index: 7)
        case "i" : isCorrect(index: 8)
        case "j" : isCorrect(index: 9)
        case "k" : isCorrect(index: 10)
        case "l" : isCorrect(index: 11)
        case "m" : isCorrect(index: 12)
        case "n" : isCorrect(index: 13)
        case "o" : isCorrect(index: 14)
        case "p" : isCorrect(index: 15)
        case "q" : isCorrect(index: 16)
        case "r" : isCorrect(index: 17)
        case "s" : isCorrect(index: 18)
        case "t" : isCorrect(index: 19)
        case "u" : isCorrect(index: 20)
        case "v" : isCorrect(index: 21)
        case "w" : isCorrect(index: 22)
        case "x" : isCorrect(index: 23)
        case "y" : isCorrect(index: 24)
        case "z" : isCorrect(index: 25)
        default:
            print("문제있음")
        }
    }
    func changeBtnSimilar(text : String) {
        switch text {
        case "a" : isSimilar(index: 0)
        case "b" : isSimilar(index: 1)
        case "c" : isSimilar(index: 2)
        case "d" : isSimilar(index: 3)
        case "e" : isSimilar(index: 4)
        case "f" : isSimilar(index: 5)
        case "g" : isSimilar(index: 6)
        case "h" : isSimilar(index: 7)
        case "i" : isSimilar(index: 8)
        case "j" : isSimilar(index: 9)
        case "k" : isSimilar(index: 10)
        case "l" : isSimilar(index: 11)
        case "m" : isSimilar(index: 12)
        case "n" : isSimilar(index: 13)
        case "o" : isSimilar(index: 14)
        case "p" : isSimilar(index: 15)
        case "q" : isSimilar(index: 16)
        case "r" : isSimilar(index: 17)
        case "s" : isSimilar(index: 18)
        case "t" : isSimilar(index: 19)
        case "u" : isSimilar(index: 20)
        case "v" : isSimilar(index: 21)
        case "w" : isSimilar(index: 22)
        case "x" : isSimilar(index: 23)
        case "y" : isSimilar(index: 24)
        case "z" : isSimilar(index: 25)
        default:
            print("문제있음")
        }
    }
    func changeBtnWrong(text : String) {
        switch text {
        case "a" : isWrong(index: 0)
        case "b" : isWrong(index: 1)
        case "c" : isWrong(index: 2)
        case "d" : isWrong(index: 3)
        case "e" : isWrong(index: 4)
        case "f" : isWrong(index: 5)
        case "g" : isWrong(index: 6)
        case "h" : isWrong(index: 7)
        case "i" : isWrong(index: 8)
        case "j" : isWrong(index: 9)
        case "k" : isWrong(index: 10)
        case "l" : isWrong(index: 11)
        case "m" : isWrong(index: 12)
        case "n" : isWrong(index: 13)
        case "o" : isWrong(index: 14)
        case "p" : isWrong(index: 15)
        case "q" : isWrong(index: 16)
        case "r" : isWrong(index: 17)
        case "s" : isWrong(index: 18)
        case "t" : isWrong(index: 19)
        case "u" : isWrong(index: 20)
        case "v" : isWrong(index: 21)
        case "w" : isWrong(index: 22)
        case "x" : isWrong(index: 23)
        case "y" : isWrong(index: 24)
        case "z" : isWrong(index: 25)
        default:
            print("문제있음")
        }
    }
    
    func isCorrect(index : Int){
        if self.myAnswer.imageKey[1].btnKey[index] != "correct"{
            self.myAnswer.imageKey[1].btnKey[index] = "correct"
        }
    }
    func isSimilar(index : Int){
        if self.myAnswer.imageKey[1].btnKey[index] != "correct" {
            self.myAnswer.imageKey[1].btnKey[index] = "similar"
        }
    }
    func isWrong(index : Int) {
        if self.myAnswer.imageKey[1].btnKey[index] == "blank" {
            self.myAnswer.imageKey[1].btnKey[index] = "wrong"
        }
    }
    
    // MARK: - 리프레쉬 버튼
    func refreshBtn() {
        if self.myAnswer.level < 1 {
            self.deleteAnswer()
        }else {
            for i in 0...self.myAnswer.level{
                if i == 5 { break }
                for j in 0...self.myAnswer.text[i].text.count-1{
                    self.myAnswer.text[i].text[j] = ""
                    self.myAnswer.imageKey[i].key[j] = "textField"
                }
            }
            for i in 0...self.myAnswer.imageKey[1].btnKey.count-1 {
                self.myAnswer.imageKey[1].btnKey[i] = "blank"
            }
            
            self.myAnswer.isSolved = false
            self.myAnswer.level = 0
            self.myAnswer.index = 0
        }
    }
    
}
