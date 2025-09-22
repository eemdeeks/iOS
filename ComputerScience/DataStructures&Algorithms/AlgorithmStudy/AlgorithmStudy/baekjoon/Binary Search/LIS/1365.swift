//
//  1365.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/21/25.
//

func solution1365() {
    let count: Int = Int(readLine()!)!
    var edges: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    var dp: Int = 1
    var x: [Int] = [edges.removeFirst()]

    for edge in edges {
        if x.last! < edge {
            x.append(edge)
            dp += 1
        } else {
            x[binarySearch(edge, x)] = edge
        }
    }

    func binarySearch(_ value: Int, _ array: [Int]) -> Int {
        var start = 0
        var end = array.count - 1
        var mid = (start + end) / 2

        while start < end - 1 {
            if array[mid] == value { return mid }
            else if array[mid] < value {
                start = mid
            } else {
                end = mid
            }

            mid = (start + end) / 2
        }

        if array[start] < value { return end }
        else { return start }
    }

    print(count - dp)
}
