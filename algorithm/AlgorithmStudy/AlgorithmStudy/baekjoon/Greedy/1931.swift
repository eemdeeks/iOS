//
//  1931.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/9/25.
//

func solution1931() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    
    var meetings: [[Int]] = []
    var stack: [Int] = []

    for _ in 0..<n {
        meetings.append([fileIO.readInt(), fileIO.readInt()])
    }

    meetings.sort {
        if $0[1] == $1[1] {
            return $0[0] < $1[0]
        } else {
            return $0[1] < $1[1]
        }
    }

    for meeting in meetings {
        guard let last = stack.last else {
            stack.append(meeting[1])
            continue
        }
        if last <= meeting[0] {
            stack.append(meeting[1])
        }
    }

    print(stack.count)
}
