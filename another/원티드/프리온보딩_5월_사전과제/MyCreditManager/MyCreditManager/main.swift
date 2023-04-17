//
//  main.swift
//  MyCreditManager
//
//  Created by 박승찬 on 2023/04/17.
//

import Foundation

let creditManager = CreditManager()
var flag = true
while flag {
    creditManager.intro()
    let input = readLine()
    switch input {
    case "1" :
        creditManager.addStudent()
    case "2" :
        creditManager.deleteStudent()
    case "3" :
        creditManager.addScore()
    case "4" :
        creditManager.deleteScore()
    case "5" :
        creditManager.grade()
    case "X" :
        creditManager.ending()
        flag = false
    default :
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}
