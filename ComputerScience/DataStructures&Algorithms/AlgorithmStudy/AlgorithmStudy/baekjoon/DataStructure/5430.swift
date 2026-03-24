//
//  Deque.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/24/26.
//


func solution5430() {
    guard let line = readLine(), let testCaseCount = Int(line) else { return }

    for _ in 0..<testCaseCount {
        guard let commands = readLine(),
              let nString = readLine(), let n = Int(nString),
              let arrayString = readLine() else { break }

        let content = arrayString.dropFirst().dropLast()
        let elements = n == 0 ? [] : content.split(separator: ",")

        var queue = Deque(elements: elements)
        var errorFlag = false

        for command in commands {
            if command == "R" {
                queue.reverse()
            } else if command == "D" {
                if !queue.pop() {
                    errorFlag = true
                    break
                }
            }
        }

        if errorFlag {
            print("error")
        } else {
            print(queue.description())
        }
    }


    struct Deque<T: StringProtocol> {
        private var elements: [T]
        private var head: Int
        private var tail: Int
        private var isReversed: Bool = false

        init(elements: [T]) {
            self.elements = elements
            self.head = 0
            self.tail = elements.count
        }

        var isEmpty: Bool {
            return head >= tail
        }

        mutating func reverse() {
            isReversed.toggle()
        }


        mutating func pop() -> Bool {
            if isEmpty { return false }

            if isReversed {
                tail -= 1
            } else {
                head += 1
            }
            return true
        }

        func description() -> String {
            if isEmpty { return "[]" }

            let slice = elements[head..<tail]
            let joinedContent = isReversed
                ? slice.reversed().joined(separator: ",")
                : slice.joined(separator: ",")

            return "[" + joinedContent + "]"
        }
    }

}
