//
//  1477.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 11/4/25.
//


// 이분탐색, 매개변수탐색

// 0 10 512

// 47

/*
 전체 길이에서 이분탐색을 통해, 해당 길이에 따른 휴계소 설치 개수가 m개가 되는 최대 값을 찾는다.
 이 때, 이분탐색을 하는 조건은 해당 길이(Mid)가 나올 수 있도록 휴계소를 설치 했을 때, m보다 많이 설치해야하는지와 적게 설치해야하는지에 따라 이분탐색하면 된다..
 */

func solution1477() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()
    let l = fileIO.readInt()

    var positions: [Int] = []

    if n > 0 {
        for _ in 0..<n {
            let p = fileIO.readInt()
            positions.append(p)
        }
    }

    positions.append(l)
    positions.sort()

    var distances: [Int] = []

    for i in 0..<positions.count {
        if i == 0 {
            distances.append(positions[i])
            continue
        }
        distances.append(positions[i] - positions[i - 1])
    }

    var start = 0
    var end = l

    while start + 1 < end {
        let mid = (start + end) / 2

        let restCount = newRestCount(mid)

        if restCount > m {
            start = mid
        } else {
            end = mid
        }
    }

    print(newRestCount(end) <= m ? end: start)

    func newRestCount(_ length: Int) -> Int {
        var result = 0
        for i in distances {
            result += i / length
            if i % length == 0 { result -= 1 }
        }

        return result
    }
}
