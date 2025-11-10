//
//  2661.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/10/25.
//

/*
 백트래킹 및 깊이 우선 탐색을 이용.
 1, 2, 3 을 집어 넣으면 중복이 발생하는지를 검사 하여 깊이 우선 탐색.
 작은 수 부터 넣었으니, 값이 도출되면 바로 출력 후 재귀 멈춤.
 */

func solution2661() {
    let n = Int(readLine()!)!

    var answer: [String] = []

    track([])

    func track(_ elements: [String]) {
        if answer.count > 0 { return }

        if elements.count == n {
            answer = elements
            return
        }

        for number in ["1", "2", "3"] {
            if goodNumber(number, elements) {
                track(elements + [number])
            }
        }
    }

    func goodNumber(_ number: String, _ numbers: [String]) -> Bool {
        var comparableNumbers: [String] = numbers
        var comparedNumbers: [String] = [number]

        while comparedNumbers.count <= comparableNumbers.count {

            var isSame: Bool = true
            for i in 0..<comparedNumbers.count {
                if comparableNumbers[comparableNumbers.count - 1 - i] != comparedNumbers[i] {
                    isSame = false
                    break
                }
            }

            if isSame { return false }
            guard let last = comparableNumbers.popLast() else { continue }
            comparedNumbers.append(last)
        }

        return true
    }

    print(answer.joined())
}
