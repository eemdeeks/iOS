//
//  16173.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/05/22.
//

import Foundation

func solution16173() {
    guard let n: Int = Int(readLine() ?? "0") else { return }
    var prob: [[Int]] = []
    for _ in 0..<n {
        let row: [Int] = readLine()!.components(separatedBy: " ").map{ Int(String($0))!}
        prob.append(row)
    }
    var answer: Bool = false
    var needVisitQueue: [[Int]] = [[0,0]]
    while !needVisitQueue.isEmpty{
        if prob[needVisitQueue[0][0]][needVisitQueue[0][1]] == -1 {
            answer = true
            break
        } else if prob[needVisitQueue[0][0]][needVisitQueue[0][1]] == 0{
            needVisitQueue.removeFirst()
        } else {
            if needVisitQueue[0][0]+prob[needVisitQueue[0][0]][needVisitQueue[0][1]] < n {
                needVisitQueue.append([needVisitQueue[0][0]+prob[needVisitQueue[0][0]][needVisitQueue[0][1]],needVisitQueue[0][1]])
            }
            if needVisitQueue[0][1]+prob[needVisitQueue[0][0]][needVisitQueue[0][1]] < n{
                needVisitQueue.append([needVisitQueue[0][0],needVisitQueue[0][1]+prob[needVisitQueue[0][0]][needVisitQueue[0][1]]])
            }
            
            needVisitQueue.removeFirst()
        }
        
    }
    if answer {
        print("HaruHaru")
    } else {
        print("Hing")
    }
}
