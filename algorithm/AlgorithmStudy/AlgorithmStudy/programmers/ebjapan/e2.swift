//
//  e2.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 4/6/24.
//

import Foundation

struct Day {
    var wearableCloth: Set<Int> = []
}

struct Cloth {
    var day: [Int] = []
}

func solutionE2(_ m:Int, _ temperatures:[Int], _ clothes:[[Int]]) -> Int {

    var days: [Day] = Array(repeating: Day(), count: temperatures.count)

    for i in 0..<temperatures.count {
        for j in 0..<clothes.count {
            if clothes[j][0] <= temperatures[i] && temperatures[i] <= clothes[j][1] {
                days[i].wearableCloth.insert(j)
            }
        }
    }
    for day in days {
        print(day.wearableCloth)
    }
    var startDayClothCount = 500000
    var answer = 0
    for start in 0...temperatures.count-m {
        var clothCount = 0
        var comp: [Bool] = Array(repeating: false, count: m)
        for i in 0..<comp.count {
            if comp[i] {
                continue
            }
            clothCount += 1
            comp[i] = true

            for j in i..<comp.count {
                if days[i+start].wearableCloth.intersection(days[j+start].wearableCloth) != [] {
                    comp[j] = true
                }
            }

        }
        print(clothCount)
        if startDayClothCount > clothCount {
            answer = start
            startDayClothCount = clothCount
        }
    }
    return answer+1
}
