//
//  15961.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 1/15/26.
//

// 슬라이딩 윈도우
func solution15961() {
    let fileIO = FileIO()

    let n = fileIO.readInt()    // 점시의 수
    let _ = fileIO.readInt()    // 초밥의 가짓 수
    let k = fileIO.readInt()    // 연속해서 먹는 접시의 수 k
    let c = fileIO.readInt()    // 쿠폰 번호

    var sushies: [Int] = []

    for _ in 0..<n {
        sushies.append(fileIO.readInt())
    }

    var ateSushies: [Int: Int] = [:]

    for i in 0..<k - 1 {
        if let count = ateSushies[sushies[i]] {
            ateSushies[sushies[i]] = count + 1
        } else {
            ateSushies[sushies[i]] = 1
        }
    }

    if let count = ateSushies[sushies[n - 1]] {
        ateSushies[sushies[n - 1]] = count + 1
    } else {
        ateSushies[sushies[n - 1]] = 1
    }

    var startIndex: Int
    var endIndex: Int
    var answer: Int = 0

    for i in 0..<n {
        endIndex = (i + k - 1) % n
        startIndex = (i + n - 1) % n

        if let sushiCount = ateSushies[sushies[startIndex]] {
            ateSushies[sushies[startIndex]] = sushiCount == 1 ? nil: sushiCount - 1
        }

        if let sushiCount = ateSushies[sushies[endIndex]] {
            ateSushies[sushies[endIndex]] = sushiCount + 1
        } else {
            ateSushies[sushies[endIndex]] = 1
        }

        if let _ = ateSushies[c] {
            answer = max(answer, ateSushies.count)
        } else {
            answer = max(answer, ateSushies.count + 1)
        }
    }

    print(answer)

}
