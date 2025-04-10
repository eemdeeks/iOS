//
//  18258.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/16.
//

func solution18258() {
    let n : Int = Int(readLine()!)!
    var queue : Queue18258 = Queue18258(queue: [])
    var answer: [String] = []
    let fileIO = FileIO()
    for _ in 1...n{
//        let input = readLine()!.split(separator: " ").map { String($0) }
        let input = fileIO.readString()
        switch input {
        case "push":
            queue.append(fileIO.readInt())
            print("push\(queue)")
        case "pop":
            if let element = queue.pop() {
                answer.append("\(element)")
            } else {
                answer.append("-1")
            }
        case "size":
            answer.append("\(queue.count)")
        case "empty":
            if queue.isEmpty { answer.append("1")}
            else { answer.append("0")}
        case "front":
            if queue.isEmpty { answer.append("-1")}
            else { answer.append("\(queue.queue[queue.head])")}
        case "back":
            if queue.isEmpty { answer.append("-1")}
            else { answer.append("\(queue.queue.last!)")}
        default:
            return
        }
    }
    print(answer.joined(separator: "\n"))
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
