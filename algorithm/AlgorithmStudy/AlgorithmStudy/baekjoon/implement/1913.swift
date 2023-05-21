//
//  1913.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/05/21.
//

import Foundation

func solution1913() {
    guard let N: Int = Int(readLine() ?? "0") else { return}
    guard let num: Int = Int(readLine() ?? "0") else {return}
    
    var answerArray: [[Int]] = []
    for i in 0...N+1{
        answerArray.append([])
        for j in 0...N+1{
            if i == 0 || i == N+1 || j == 0 || j == N+1{
                answerArray[i].append(-1)
            }else {
                answerArray[i].append(0)
            }
            
        }
    }
    var x: Int = 1
    var y: Int = 1
    var flag: String = "down"
    let max: Int = N*N
    var answer: [Int] = [0,0]
    for i in 0..<max{
        answerArray[y][x] = max - i
        switch flag{
        case "right":
            if answerArray[y][x+1] != 0{
                flag = "up"
                y -= 1
            }else {
                x += 1
            }
        case "down":
            if answerArray[y+1][x] != 0{
                flag = "right"
                x += 1
            }else{
                y += 1
            }
        case "left":
            if answerArray[y][x-1] != 0{
                flag = "down"
                y += 1
            }else{
                x -= 1
            }
        case "up":
            if answerArray[y-1][x] != 0{
                flag = "left"
                x -= 1
            }else{
                y -= 1
            }
        default:
            break
        }
    }
    for i in 1...N{
        for j in 1...N{
            if answerArray[i][j] == num{
                answer[0] = i
                answer[1] = j
            }
            print(answerArray[i][j], terminator: " ")
        }
        print("")
    }
    print(answer.map{String($0)}.joined(separator: " "))
    
}
