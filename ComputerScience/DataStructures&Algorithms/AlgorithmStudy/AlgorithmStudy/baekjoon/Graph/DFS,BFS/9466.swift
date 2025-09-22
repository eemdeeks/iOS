//
//  9466.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 5/23/25.
//

// 그래프 이론, 그래프 탐색, 깊이 우선 탐색
func solution9466() {
    let fileIO = FileIO()

    let t = fileIO.readInt()
    var answer: [String] = []

    for _ in 0..<t {
        let n = fileIO.readInt()
        var wantStudent: [Int] = [0]
        var visited: [Bool] = Array(repeating: false, count: n + 1)
        var hasTeamStudent: [Int] = Array(repeating: 0, count: n + 1)

        for _ in 0..<n {
            wantStudent.append(fileIO.readInt())
        }

        for student in 1...n {
            if visited[student] { continue }

            var team: [Int] = [student]
            var teamContains: Set<Int> = [student]
            visited[student] = true

            var stack: [Int] = [student]
            while !stack.isEmpty {
                let newStudent = stack.removeLast()

                let want = wantStudent[newStudent]

                if visited[want] {
                    if teamContains.contains(want) {
                        guard let index = team.firstIndex(of: want) else { return }
                        for i in index..<team.count {
                            hasTeamStudent[team[i]] = 1
                        }
                    }
                    break
                } else {
                    team.append(want)
                    teamContains.insert(want)
                    visited[want] = true
                    stack.append(want)
                }
            }
        }
        var hasTeamCount = hasTeamStudent.reduce(0, +)

        answer.append(String(n - hasTeamCount))
    }

    print(answer.joined(separator: "\n"))
}
