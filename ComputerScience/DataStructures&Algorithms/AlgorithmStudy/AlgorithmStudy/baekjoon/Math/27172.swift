//
//  File.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 7/8/25.
//

func solution27172() {
    let fileIO = FileIO()
    let n = fileIO.readInt()
    var cards: [Int] = []
    var cardsSet: Set<Int> = []
    var points: [Int] = Array(repeating: 0, count: 1000001)
    for _ in 0..<n {
        let card = fileIO.readInt()
        cards.append(card)
        cardsSet.insert(card)
    }

    for card in cards {
        var multiple = card * 2
        while multiple <= 1000000 {
            if cardsSet.contains(multiple) {
                points[card] += 1
                points[multiple] -= 1
            }
            multiple += card
        }
    }

    var answer: [String] = []
    for card in cards {
        answer.append(String(points[card]))
    }

    print(answer.joined(separator: " "))
}
