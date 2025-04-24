//
//  18258.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/16.
//

func solution18258() {
    let fileIO = FileIOFast()
    let n : Int = fileIO.readInt()
    var queue : Queue18258 = Queue18258(queue: [])
    var answer: String = ""
    for _ in 1...n{
        let input = fileIO.readStringSum()
        switch input {
        case 448:
            queue.append(fileIO.readInt())
        case 335:
            if let element = queue.pop() {
                answer.append("\(element)\n")
            } else {
                answer.append("-1\n")
            }
        case 443:
            answer.append("\(queue.count)\n")
        case 559:
            if queue.isEmpty { answer.append("1\n")}
            else { answer.append("0\n")}
        case 553:
            if queue.isEmpty { answer.append("-1\n")}
            else { answer.append("\(queue.queue[queue.head])\n")}
        case 401:
            if queue.isEmpty { answer.append("-1\n")}
            else { answer.append("\(queue.queue.last!)\n")}
        default:
            return
        }
    }
    if answer.count >= 2 {
        answer.removeLast()
    }
    print(answer)
}

struct Queue18258<T> {
    var queue: [T]
    var head: Int = 0

    var isEmpty: Bool { queue.count <= head }
    var count: Int { queue.count - head }

    mutating func append(_ element: T) { queue.append(element) }

    mutating func pop() -> T? {
        if isEmpty { return nil }
        head += 1
        return queue[head - 1]
    }
}
