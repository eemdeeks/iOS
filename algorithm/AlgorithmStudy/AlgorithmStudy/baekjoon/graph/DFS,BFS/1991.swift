//
//  1991.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 12/20/23.
//

import Foundation

func solution1991() {
    let N: Int = Int(readLine()!)!
    var graph: [[Int]] = Array(repeating: [-1,-1], count: N)
    var frontAnswer: [Int] = []
    var midAnswer: [Int] = []
    var backAnswer: [Int] = []
    for _ in 0..<N {
        let prob: [String] = readLine()!.components(separatedBy: " ")
        if prob[1] != "." {
            graph[Int(UnicodeScalar(prob[0])!.value) - 65][0] = Int(UnicodeScalar(prob[1])!.value) - 65
        }
        if prob[2] != "." {
            graph[Int(UnicodeScalar(prob[0])!.value) - 65][1] = Int(UnicodeScalar(prob[2])!.value) - 65
        }
    }
    front(graph, index: 0, frontAnswer: &frontAnswer)
    mid(graph, index: 0, midAnswer: &midAnswer)
    back(graph, index: 0, backAnswer: &backAnswer)

    var answer: [[UnicodeScalar]] = Array(repeating: [], count: 3)
    answer[0] = frontAnswer.map{
        UnicodeScalar($0+65) ?? "0"
    }
    answer[1] = midAnswer.map{
        UnicodeScalar($0+65) ?? "0"
    }
    answer[2] = backAnswer.map{
        UnicodeScalar($0+65) ?? "0"
    }
    for i in 0..<answer.count {
        print(answer[i].map{String($0)}.joined(separator: ""))
    }
}

func front(_ graph: [[Int]], index: Int, frontAnswer: inout [Int]) {
    
    frontAnswer.append(index)
    if graph[index][0] != -1 {
        front(graph, index: graph[index][0], frontAnswer: &frontAnswer)
    }
    if graph[index][1] != -1 {
        front(graph, index: graph[index][1], frontAnswer: &frontAnswer)
    }
}

func mid(_ graph: [[Int]], index: Int, midAnswer: inout [Int]) {
    if graph[index][0] != -1 {
        mid(graph, index: graph[index][0], midAnswer: &midAnswer)
    }
    midAnswer.append(index)
    if graph[index][1] != -1 {
        mid(graph, index: graph[index][1], midAnswer: &midAnswer)
    }
}

func back(_ graph: [[Int]], index: Int, backAnswer: inout [Int]) {
    if graph[index][0] != -1 {
        back(graph, index: graph[index][0], backAnswer: &backAnswer)
    }
    if graph[index][1] != -1 {
        back(graph, index: graph[index][1], backAnswer: &backAnswer)
    }
    backAnswer.append(index)
}

