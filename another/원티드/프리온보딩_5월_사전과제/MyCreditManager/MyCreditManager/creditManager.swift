//
//  creditManager.swift
//  MyCreditManager
//
//  Created by 박승찬 on 2023/04/17.
//

import Foundation

class CreditManager {
    var students : [Student]
    init(students: [Student] = []) {
        self.students = students
    }
}

extension CreditManager {
    final class Student {
        var name : String
        var score : Dictionary<String, String>
        init(name: String, score: Dictionary<String, String> = Dictionary<String,String>()) {
            self.name = name
            self.score = score
        }
    }
}

// MARK: - 기능 함수
extension CreditManager {
    // 메뉴 출력
    func intro() {
        print("원하는 기능을 입력해주세요")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
    }
    // 종료
    func ending() {
        print("프로그램을 종료합니다...")
    }
    // 학생추가
    // (공백에 대한 처리를 어떻게 해야될지 모르겠음..현재 공백 포함된 이름 입력 불가)
    func addStudent() {
        print("추가할 학생의 이름을 입력해주세요")
        let input = readLine()!
        if input == "" || input.contains(" ") {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }else if containStudent(input: input) >= 0{
            print("\(input)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }else {
            self.students.append(Student(name: input))
            print("\(input) 학생을 추가했습니다.")
        }
    }
    //한색유무
    func containStudent(input : String) -> Int {
        var flag = -1
        if self.students.count > 0 {
            for i in 0...self.students.count-1 {
                if self.students[i].name == input {
                    flag = i
                }
            }
        }
        return flag
    }
    //학생 삭제
    func deleteStudent() {
        print("삭제할 학생의 이름을 입력해주세요")
        let input = readLine()!
        if input == "" || input.contains(" ") {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }else if containStudent(input: input) >= 0{
            self.students.remove(at: containStudent(input: input))
            print("\(input) 학생을 삭제하였습니다.")
        }else {
            print("\(input) 학생을 찾지 못했습니다.")
        }
    }
    //성적추가(변경)
    func addScore() {
        let score : [String] = ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"]
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift A+")
        print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
        let input = readLine()!.components(separatedBy: " ")
        if input.count != 3{
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }else if containStudent(input: input[0]) >= 0 && score.contains(input[2]){
            self.students[self.containStudent(input: input[0])].score[input[1]] = input[2]
            print("\(input[0]) 학생의 \(input[1]) 과목이 \(input[2])로 추가(변경)되었습니다.")
        }else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    }
    //성적삭제
    func deleteScore() {
        let score : [String] = ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "F"]
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        print("입력예) Mickey Swift")
        let input = readLine()!.components(separatedBy: " ")
        if input.count != 2{
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }else if containStudent(input: input[0]) < 0 {
            print("\(input[0]) 학생을 찾지 못했습니다.")
        }else if containStudent(input: input[0]) >= 0 && score.contains(input[1]){
            self.students[self.containStudent(input: input[0])].score[input[1]] = nil
            print("\(input[0]) 학생의 \(input[1]) 과목의 성적이 삭제되었습니다.")
        }else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
    }
    //평점보기
    func grade() {
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        var grade : Double = 0
        let input = readLine()!
        if input == "" || input.contains(" ") {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }else if containStudent(input: input) < 0{
            print("\(input) 학생을 찾지 못했습니다.")
        }else if containStudent(input: input) >= 0{
            if self.students[self.containStudent(input: input)].score.count == 0{
                print("성적이 없습니다.")
            } else {
                for (i, j) in self.students[self.containStudent(input: input)].score {
                    switch j {
                    case "A+" :
                        grade += 4.5
                    case "A" :
                        grade += 4.0
                    case "B+" :
                        grade += 3.5
                    case "B" :
                        grade += 3.0
                    case "C+" :
                        grade += 2.5
                    case "C" :
                        grade += 2
                    case "D+" :
                        grade += 1.5
                    case "D" :
                        grade += 1
                    case "F" :
                        grade += 1
                    default:
                        grade += 0
                    }
                    print("\(i): \(j)")
                }
                grade /= Double(self.students[self.containStudent(input: input)].score.count)
                print("평점 : \(grade)")
            }
        }else {
            print("입력이 잘못되었습니다")
        }
    }
}
