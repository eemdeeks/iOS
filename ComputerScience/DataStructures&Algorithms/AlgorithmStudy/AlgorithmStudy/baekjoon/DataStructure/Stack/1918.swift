//
//  1918.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/31/25.
//

func solution1918() {
    let input = readLine()!
    var stack: [Character] = []
    var answer: [Character] = []

    for i in input {
        switch i {
        case "+", "-":
            if stack.isEmpty {
                stack.append(i)
                continue
            }
            while
                let op = stack.last,
                (op == "-" || op == "+" || op == "*" || op == "/") {
                answer.append(stack.removeLast())
            }
            stack.append(i)
        case "*", "/":
            if stack.isEmpty {
                stack.append(i)
                continue
            }
            while
                let op = stack.last,
                (op == "*" || op == "/") {
                answer.append(stack.removeLast())
            }
            stack.append(i)
        case "(":
            stack.append(i)
        case ")":
            while true {
                let op = stack.removeLast()
                if op == "(" {
                    break
                } else {
                    answer.append(op)
                }
            }
        default:
            answer.append(i)
        }
    }

    while !stack.isEmpty {
        answer.append(stack.removeLast())
    }

    print(answer.map { String($0) }.joined(separator: ""))
}
