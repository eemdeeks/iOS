//
//  File.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/5/25.
//


/*
 D = values / M

 values 는 내림차순이라 가정 -> D도 내림차순

 values[0] % M = N -> values[0] = D[0] * M + N
 values[1] % M = N -> values[1] = D[1] * M + N
 values[2] % M = N -> values[2] = D[2] * M + N

 N = values[1] - D[1] * M

 values[0] = D[0] * M + values[1] - D[1] * M
           = (D[0] - D[1]) * M + values[1]

 values[0] - values[1] = (D[0] - D[1]) * M

 values[1] - values[2] = (D[1] - D[2]) * M

 위에서 D = values / M 이었으므로, D는 자연수 ( 1 <= values )

 D는 내림 차순 이었기 때문에 (D[i] - D[i + 1]) 는 0 또는 자연수 그러나 M은 1 보다 크다는 조건이 있고, values 가 내림차순이고 같은 값이 없기 때문에 0 이 될 수는 없음.
 그러므로 D[0] - D[1] 은 자연수

 즉 자연수 * 자연수 = values 이기 때문에 M 은 values[i] - values[i+1] 의 약수

 그러므로 최대 공약수를 찾은 다음 약수들을 출력하면 정답.

 */

import Foundation

func solution2981() {
    let fileIO = FileIO()

    let n = fileIO.readInt()

    var values: [Int] = []
    var comparedValue: [Int] = []

    for _ in 0..<n {
        values.append(fileIO.readInt())
    }

    values.sort(by: >)

    for i in 0..<(n - 1) {
        comparedValue.append(values[i] - values[i + 1])
    }

    var answer = comparedValue[0]

    if comparedValue.count != 1 {
        for i in 1..<comparedValue.count {
            answer = gcd(answer, comparedValue[i])
        }
    }

    var answers: Set<Int> = [answer]
    if answer >= 4 {
        for i in 2...Int(sqrt(Double(answer))) {
            if answer % i == 0 {
                answers.insert(i)
                answers.insert(answer / i)
            }
        }
    }

    print(answers.sorted().map { String($0) }.joined(separator: " "))

    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 { return a }

        let big = max(a, b)
        let small = min(a, b)

        return gcd(small, big % small)
    }

}
