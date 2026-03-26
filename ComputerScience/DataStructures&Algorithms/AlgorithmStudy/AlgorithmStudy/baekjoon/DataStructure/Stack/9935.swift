//
//  9935.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/26/26.
//


func solution9935() {
    let problem = readLine()!
    let bomb = readLine()!

    var stack: [Int] = []
    var answer: [String] = []
    var index: Int = 0

    for prob in problem {
        answer.append(String(prob))

        guard let boom = bomb[index],
              let firstBoom = bomb[0]
        else {
            return
        }

        if firstBoom == prob {
            index = 1
            stack.append(0)
        } else if boom == prob {
            stack.append(index)
            index += 1
        } else {
            stack = []
            index = 0
        }

        if index == bomb.count {
            answer.removeLast(bomb.count)
            stack.removeLast(bomb.count)
            guard let last = stack.last else {
                index = 0
                continue
            }
            index = last + 1
        }

        
    }

    if answer.count == 0 {
        print("FRULA")
    } else {
        print(answer.joined())
    }
}

private extension String {
    subscript(_ index: Int) -> Character? {
        if index >= self.count { return nil }
        let idx = self.index(self.startIndex, offsetBy: index)
        return self[idx]
    }
}


func retry9935() {
    let problem = readLine()!.map { String($0) }
    let bomb = readLine()!.map { String($0) }

    var stack: [String] = []

    for prob in problem {
        stack.append(prob)

        if stack.count >= bomb.count {
            var flag = true

            for i in 0..<bomb.count {
                if stack[stack.count - bomb.count + i] != bomb[i] {
                    flag = false

                    break
                }
            }

            if flag {
                stack.removeLast(bomb.count)
            }
        }
    }

    if stack.isEmpty {
        print("FRULA")
    } else {
        print(stack.joined())
    }
}
