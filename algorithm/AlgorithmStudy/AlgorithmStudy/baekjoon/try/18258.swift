//
//  18258.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 2023/03/16.
//

import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

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
