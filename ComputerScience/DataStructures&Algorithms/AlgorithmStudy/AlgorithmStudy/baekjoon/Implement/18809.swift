//
//  Culture.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 9/6/25.
//


func solution18809() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()
    let g = fileIO.readInt()
    let r = fileIO.readInt()

    var graph: [[Int]] = []
    var canPlaces: [(x: Int, y: Int)] = []

    for x in 0..<n {
        var elements: [Int] = []
        for y in 0..<m {
            let element: Int = fileIO.readInt()
            elements.append(element)
            if element == 2 { canPlaces.append((x, y)) }
        }
        graph.append(elements)
    }

    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]
    var maxFlowersCount = 0

    track(0, r, g, [])

    print(maxFlowersCount)

    func track(_ index: Int, _ remainRed: Int, _ remainGreen: Int, _ cultures: [(culture: Culture, x: Int, y: Int)]) {
        if remainRed + remainGreen == 0 {
            maxFlowersCount = max(maxFlowersCount, bfs(cultures))
            return
        }

        if remainRed + remainGreen > canPlaces.count - index {
            return
        }

        if index >= canPlaces.count { return }

        track(index + 1, remainRed, remainGreen, cultures)
        if remainRed > 0 {
            var newCultures = cultures
            newCultures.append((.red, canPlaces[index].x, canPlaces[index].y))
            track(index + 1, remainRed - 1, remainGreen, newCultures)
        }

        if remainGreen > 0 {
            var newCultures = cultures
            newCultures.append((.green, canPlaces[index].x, canPlaces[index].y))
            track(index + 1, remainRed, remainGreen - 1, newCultures)
        }
    }

    func bfs(_ cultures: [(culture: Culture, x: Int, y: Int)] ) -> Int {
        var flowers: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
        var visited: [[(culture: Culture?, time: Int)]] = Array(repeating: Array(repeating: (nil, -1), count: m), count: n)
        var flowerCount = 0

        var queue = Queue<(culture: Culture, x: Int, y: Int)>()

        for culture in cultures {
            visited[culture.x][culture.y] = (culture.culture, 0)
            queue.append(culture)
        }

        while !queue.isEmpty {
            guard let element = queue.removeFirst() else { break }
            if flowers[element.x][element.y] { continue }

            for i in 0..<4 {
                let newX = element.x + moveX[i]
                let newY = element.y + moveY[i]

                if newX < 0 || newX >= n || newY < 0 || newY >= m {
                    continue
                }

                if flowers[newX][newY] || graph[newX][newY] == 0 { continue }


                let newElement = (element.culture, newX, newY)

                guard let culture = visited[newX][newY].culture else {
                    visited[newX][newY] = (element.culture, visited[element.x][element.y].time + 1)
                    queue.append(newElement)
                    continue
                }

                if culture == element.culture || visited[element.x][element.y].time + 1 != visited[newX][newY].time { continue }

                flowers[newX][newY] = true
                flowerCount += 1
            }
        }
        return flowerCount
    }

    enum Culture {
        case green
        case red
    }

    struct Queue<T> {
        var frontElements: [T] = []
        var backElements: [T] = []
        var isEmpty: Bool { frontElements.isEmpty && backElements.isEmpty }

        mutating func append(_ element: T) {
            backElements.append(element)
        }

        mutating func removeFirst() -> T? {
            guard !isEmpty else { return nil }
            guard let element = frontElements.popLast() else {
                frontElements = backElements.reversed()
                backElements = []

                return frontElements.popLast()
            }

            return element
        }

    }

}
