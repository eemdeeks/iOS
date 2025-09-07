//
//  16938.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 9/7/25.
//


func solution16938() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let l = fileIO.readInt()
    let r = fileIO.readInt()
    let x = fileIO.readInt()

    var problems: [Int] = []

    for _ in 0..<n {
        problems.append(fileIO.readInt())
    }

    var answer: Int = 0

    track(0, 0, 1000001, 0, 0)

    print(answer)
    func track(_ index: Int, _ sum: Int, _ minProb: Int, _ maxProb: Int, _ count: Int) {
        if index >= n {
            return
        }

        if sum >= r { return }

        let problem = problems[index]
        let newSum = sum + problem
        let newMin = min(minProb, problem)
        let newMax = max(maxProb, problem)
        let newCount = count + 1

        track(index + 1, newSum, newMin, newMax, newCount)
        if newSum <= r && newSum >= l && newMax - newMin >= x && newCount >= 2 {
            answer += 1
        }
        track(index + 1, sum, minProb, maxProb, count)
    }

}
