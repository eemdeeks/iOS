//
//  10866.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/04/16.
//

import Foundation

func solution10866() {
    let n = Int(readLine()!)!
    //var dequeFront : [Int] = []
    //var dequeBack : [Int] = []
    //
    //for _ in 1...n{
    //    let prob = readLine()!.components(separatedBy: " ")
    //
    //    switch prob[0] {
    //    case "push_front" :
    //
    //        dequeFront.append(Int(prob[1])!)
    //    case "push_back" :
    //        dequeBack.append(Int(prob[1])!)
    //    case "pop_front" :
    //        if dequeBack.isEmpty && dequeFront.isEmpty {
    //            print("-1")
    //        } else if dequeFront.isEmpty {
    //            print(dequeBack[0])
    //        } else {
    //            print(dequeFront[dequeFront.count-1])
    //            dequeFront.removeLast()
    //        }
    //    default:
    //        if dequeBack.isEmpty && dequeFront.isEmpty {
    //            print("-1")
    //        }
    //    }
    //}
    var deque : [Int] = []
    
    for _ in 1...n {
        let prob = readLine()!.components(separatedBy: " ")
        
        switch prob[0] {
        case "push_front" :
            deque.insert(Int(prob[1])!, at: 0)
        case "push_back" :
            deque.append(Int(prob[1])!)
        case "pop_front" :
            if deque.isEmpty {
                print(-1)
            } else {
                print(deque[0])
                deque.removeFirst()
            }
        case "pop_back" :
            if deque.isEmpty {
                print(-1)
            } else {
                print(deque[deque.count-1])
                deque.removeLast()
            }
        case "size" :
            print(deque.count)
        case "empty" :
            if deque.isEmpty {
                print(1)
            } else {
                print(0)
            }
        case "front" :
            if deque.isEmpty {
                print(-1)
            } else {
                print(deque[0])

            }
        default :
            if deque.isEmpty {
                print(-1)
            } else {
                print(deque[deque.count-1])
            }
        }
    }
}
