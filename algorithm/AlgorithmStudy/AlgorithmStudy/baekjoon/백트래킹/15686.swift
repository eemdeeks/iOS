//
//  15686.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/26/25.
//

func solution15686() {
    let fileIO = FileIO()
    let n = fileIO.readInt()
    let m = fileIO.readInt()

    var chickenHouse: [(x: Int, y: Int)] = []
    var house: [(x: Int, y: Int)] = []
    for x in 0..<n {
        for y in 0..<n {
            let info = fileIO.readInt()
            if info == 1 { house.append((x, y)) }
            else if info == 2 { chickenHouse.append((x, y)) }
        }
    }

    let houseValue: [Int] = Array(repeating: 1000, count: house.count)
    var roads: [Int] = []
    for i in 0..<chickenHouse.count {
        roads.append(tracking(i, houseValue, 0))
    }
    print(roads.min()!)

    func tracking(_ chickenHouseIndex: Int, _ chickenRoad: [Int], _ depth: Int) -> Int {
        if depth == m { return chickenRoad.reduce(0, +)}

        var newChickenRoad = chickenRoad
        var isChanged: Bool = false
        for i in 0..<house.count {
            let value = calculateLoad(chickenHouse[chickenHouseIndex], house[i])
            if newChickenRoad[i] > value {
                newChickenRoad[i] = value
                isChanged = true
            }
        }

        if !isChanged { return chickenRoad.reduce(0, +) }
        if chickenHouseIndex == chickenHouse.count - 1 { return newChickenRoad.reduce(0, +) }
        var roads: [Int] = []
        for i in (chickenHouseIndex + 1)..<chickenHouse.count {
            roads.append(tracking(i, newChickenRoad, depth + 1))
        }

        return roads.min()!
    }

    func calculateLoad(_ left: (x: Int, y: Int), _ right: (x: Int, y: Int)) -> Int {
        return abs(left.x - right.x) + abs(left.y - right.y)
    }
}
