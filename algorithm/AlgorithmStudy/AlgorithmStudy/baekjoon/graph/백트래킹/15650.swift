//
//  15650.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/11/25.
//

func solution15650() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }

    let n = input[0]
    let m = input[1]

    for i in 1...n {
        nm(num: i, array: [])
    }

    func nm(num: Int, array: [Int]) {
        let new = array + [num]
        if new.count == m {
            print(new.map { String($0) }.joined(separator: " "))
        } else if new.count > m{
            return
        }

        if num + 1 > n {
            return
        }

        for i in (num + 1)...n {
            nm(num: i, array: new)
        }
    }
}
