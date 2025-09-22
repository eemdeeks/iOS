//
//  1850.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/9/25.
//

func solution1850() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let big = max(input[0], input[1])
    let min = min(input[0], input[1])

    func gcd(_ a: Int,_ b: Int) -> Int {
        guard b > 0 else { return a }

        return gcd(b, a % b)
    }

    let num = gcd(big, min)
    let answer = String(repeating: "1", count: num)
    print(answer)
}
