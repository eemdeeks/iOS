//
//  Direction.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/9/26.
//


func solution14499() {
    let fileIO = FileIO()

    let rowCount = fileIO.readInt()
    let colCount = fileIO.readInt()

    let startX = fileIO.readInt()
    let startY = fileIO.readInt()

    let commandCount = fileIO.readInt()

    var map: [[Int]] = []

    for _ in 0..<rowCount {
        var rowElements: [Int] = []
        for _ in 0..<colCount {
            rowElements.append(fileIO.readInt())
        }
        map.append(rowElements)
    }

    // 1: 동쪽
    // 2: 서쪽
    // 3: 북쪽
    // 4: 남쪽
    var commands: [Int] = []

    for _ in 0..<commandCount {
        commands.append(fileIO.readInt())
    }

    var dice = Dice()
    var dicePosition: (x: Int, y: Int) = (startX, startY)
    var answer: [String] = []

    for command in commands {
        if let direction = Direction(rawValue: command) {
            let newPosition = direction.move(dicePosition)

            if newPosition.x < 0 || newPosition.x >= rowCount || newPosition.y < 0 || newPosition.y >= colCount {
                continue
            }

            dice.roll(direction)
            dicePosition = newPosition

            if map[dicePosition.x][dicePosition.y] == 0 {
                map[dicePosition.x][dicePosition.y] = dice.bottom
            } else {
                dice.bottom = map[dicePosition.x][dicePosition.y]
                map[dicePosition.x][dicePosition.y] = 0
            }

            answer.append(String(dice.top))
        }
    }

    print(answer.joined(separator: "\n"))

    enum Direction: Int {
        case east = 1
        case west
        case north
        case south

        static let moveX = [0, 0, -1, 1]
        static let moveY = [1, -1, 0, 0]

        func move(_ position: (x: Int, y: Int)) -> (x: Int, y: Int) {
            let newX = position.x + Self.moveX[self.rawValue - 1]
            let newY = position.y + Self.moveY[self.rawValue - 1]

            return (newX, newY)
        }
    }

    struct Dice {
        var top: Int = 0
        var bottom: Int = 0
        var front: Int = 0
        var back: Int = 0
        var left: Int = 0
        var right: Int = 0

        mutating func roll(_ direction: Direction) {
            switch direction {
            case .east:
                (top, right, bottom, left) = (left, top, right, bottom)
            case .west:
                (top, left, bottom, right) = (right, top, left, bottom)
            case .north:
                (top, front, bottom, back) = (front, bottom, back, top)
            case .south:
                (top, back, bottom, front) = (back, bottom, front, top)
            }

        }
    }

}
