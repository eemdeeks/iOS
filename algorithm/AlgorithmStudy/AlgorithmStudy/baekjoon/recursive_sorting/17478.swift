//
//  17478.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/18.
//

import Foundation

func solution17478() {
    let N = Int(readLine()!)!
    print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")
    whatRecursive(n: 0,m: N)
    
}

func whatRecursive(n : Int, m: Int) {
    
    if n >= 1{
        for _ in 1...n{
            print("____",terminator: "")
        }
    }
    print("\"재귀함수가 뭔가요?\"")
    
    
    if n != m {
        if n >= 1{
            for _ in 1...n{
                print("____",terminator: "")
            }
        }
        print("\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.")
        if n >= 1{
            for _ in 1...n{
                print("____",terminator: "")
            }
        }
        print("마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.")
        if n >= 1{
            for _ in 1...n{
                print("____",terminator: "")
            }
        }
        print("그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\"")
        let index = n + 1
        whatRecursive(n: index, m: m)
    } else {
        if n >= 1{
            for _ in 1...n{
                print("____",terminator: "")
            }
        }
        print("\"재귀함수는 자기 자신을 호출하는 함수라네\"")
    }
    if n >= 1{
        for _ in 1...n{
            print("____",terminator: "")
        }
    }
    print("라고 답변하였지.")
    
}
