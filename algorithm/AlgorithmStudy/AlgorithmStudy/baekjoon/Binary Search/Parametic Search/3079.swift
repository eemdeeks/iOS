//
//  3079.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 9/18/25.
//

// 매개변수탐색
func solution3079() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var immigrations: [Int] = []

    for _ in 0..<n {
        immigrations.append(fileIO.readInt())
    }

    var start: Int64 = 0
    var end: Int64 = Int64(immigrations[0]) * Int64(m)   // 최소시간 * 인원

    while start < end - 1 {
        let mid = (start + end) / 2
        if paramSearch(mid) { end = mid }
        else { start = mid }
    }

    if paramSearch(start) {
        print(start)
    } else {
        print(end)
    }

    func paramSearch(_ maxTime: Int64) -> Bool {
        var possible: Int64 = 0
        for time in immigrations {
            possible += maxTime / Int64(time)
            if possible >= m { return true }
        }

        return false
    }
}

