//
//  5719.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/23/25.
//

func solution5719() {
    let fileIO = FileIO()

    while true {
        let n: Int = fileIO.readInt()  // 장소의 수
        let m: Int = fileIO.readInt()   // 도로의 수

        if n + m == 0 { return }    // 입력이 둘다 0일 경우 종료

        let start: Int = fileIO.readInt()   // 시작점
        let destination: Int = fileIO.readInt() // 도착점

        var graph: [Set<[Int]>] = Array(repeating: [], count: n)    // [도로의 출발점][도착점, 도로의 길이]
        var reverseGraph: [Set<[Int]>] = Array(repeating: [], count: n)

        for _ in 0..<m {
            let u = fileIO.readInt()
            let v = fileIO.readInt()
            let p = fileIO.readInt()
            graph[u].insert([v, p])
            reverseGraph[v].insert([u, p])
        }

        // 1. 다익스트라로 최단 거리 찾기
        // 2. 깊이 우선 탐색으로 최단 거리가 되는 도로 찾기
        // 3. 최단 거리 다리를 제외하고 다익스트라 이용해서 거의 최단거리 찾기
        var shortestRoute: Set<[Int]> = []
        var villages: [Int] = []

        let _: Int = findShortest()

        var stack: [Int] = [destination]
        var visited: [Bool] = Array(repeating: false, count: n)
        
        while !stack.isEmpty {
            let element = stack.removeLast()
            if visited[element] { continue }
            visited[element] = true

            for edge in reverseGraph[element] {
                if villages[edge[0]] + edge[1] == villages[element] {
                    shortestRoute.insert([edge[0], element])
                    stack.append(edge[0])
                }
            }
        }

        print(findShortest())

        enum Route {
            case shortest
            case almostShortest
            case none
        }

        func findShortest() -> Int {
            villages = Array(repeating: 5000001, count: n)
            var visited: [Bool] = Array(repeating: false, count:n )
            villages[start] = 0
            var heap = Heap<(p: Int, v: Int)>(elements: [(0, start)]) { $0.p < $1.p }   // (가중치, 마을번호)

            while !heap.isEmpty {
                guard let element = heap.removeFirst() else { break }

                if element.v == destination { return element.p }

                if visited[element.v] { continue }
                visited[element.v] = true

                for edge in graph[element.v] {
                    if visited[edge[0]] { continue }
                    if shortestRoute.contains([element.v, edge[0]]) { continue }
                    if element.p + edge[1] < villages[edge[0]] {
                        heap.insert((element.p + edge[1], edge[0]))
                        villages[edge[0]] = element.p + edge[1]
                    }
                }
            }
            return -1
        }
    }

    struct Heap<T> {
        var elements: [T]
        var sort: (T, T) -> Bool
        var isEmpty: Bool { elements.isEmpty }

        func leftChild(of index: Int) -> Int { index * 2 + 1 }
        func rightChild(of index: Int) -> Int { index * 2 + 2 }
        func parent(of index: Int) -> Int {
            (index - 1) / 2
        }

        mutating func insert(_ node: T) {
            elements.append(node)
            guard !elements.isEmpty else { return }
            swimUp()
        }

        mutating func swimUp() {
            var index = elements.count - 1

            while index != 0 && sort(elements[index], elements[parent(of: index)]) {
                elements.swapAt(index, parent(of: index))
                index = parent(of: index)
            }
        }

        mutating func removeFirst() -> T? {
            guard !elements.isEmpty else { return nil }
            elements.swapAt(0, elements.count - 1)
            let element = elements.removeLast()
            diveDown(0)

            return element
        }

        mutating func diveDown(_ index: Int) {
            var priority = index
            let leftChild = leftChild(of: index)
            let rightChild = rightChild(of: index)

            if leftChild < elements.count && sort(elements[leftChild], elements[priority]) {
                priority = leftChild
            }

            if rightChild < elements.count && sort(elements[rightChild], elements[priority]) {
                priority = rightChild
            }

            if priority != index {
                elements.swapAt(priority, index)
                diveDown(priority)
            }
        }
    }
}
