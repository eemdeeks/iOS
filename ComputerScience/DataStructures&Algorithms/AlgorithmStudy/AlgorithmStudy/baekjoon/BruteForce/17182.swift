//
//  17182.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 10/24/25.
//


func solution17182() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let start = fileIO.readInt()

    var distances: [[Int]] = []

    for _ in 0..<n {
        var distance: [Int] = []
        for _ in 0..<n {
            distance.append(fileIO.readInt())
        }
        distances.append(distance)
    }

    for i in 0..<n {
        for x in 0..<n where x != i {
            let value = distances[x][i]
            for y in 0..<n {
                distances[x][y] = min(distances[x][y], value + distances[i][y])
            }
        }
    }
    var answer = Int.max
    var visited = Array(repeating: false, count: n)
    visited[start] = true
    track(visited, [start])

    print(answer)

    func track(_ visited: [Bool], _ planets: [Int]) {
        if planets.count == n {
            answer = min(answer, calculateDistance(planets))
            return
        }

        for i in 0..<n where !visited[i] {
            var newVisited = visited
            newVisited[i] = true
            let newPlanets = planets + [i]
            track(newVisited, newPlanets)
        }
    }

    func calculateDistance(_ planets: [Int]) -> Int {
        var distance = 0
        for i in 1..<n {
            let start = planets[i - 1]
            let end = planets[i]
            distance += distances[start][end]
            if distance > answer { return Int.max }
        }

        return distance
    }
}
