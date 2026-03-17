//
//  Queue.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 3/17/26.
//


func solution13460() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    let m = fileIO.readInt()

    typealias position = (x: Int, y: Int)

    var map: [[String]] = []

    var visited: [[[[Int]]]] = Array(repeating:
                                            Array(repeating:
                                                    Array(repeating:
                                                            Array(repeating: -1, count: m),
                                                          count: n),
                                                  count: m),
                                          count: n)

    var blue: position = (x: 0, y: 0)
    var red: position = (x: 0, y: 0)
    var hole: position = (x: 0, y: 0)

    for x in 0..<n {
        var array: [String] = fileIO.readString().map { String($0) }
        for y in 0..<m {
            switch array[y] {
            case "B":
                blue = (x, y)
                array[y] = "."
            case "R":
                red = (x, y)
                array[y] = "."
            case "O":
                hole = (x, y)
            default:
                continue
            }
        }
        map.append(array)
    }

    var queue: Queue<(red: position, blue: position)> = Queue(elements: [(red, blue)])
    visited[red.x][red.y][blue.x][blue.y] = 0


    // 상 좌 하 우
    let moveX = [-1, 0, 1, 0]
    let moveY = [0, -1, 0, 1]

    while !queue.isEmpty {
        guard let element = queue.removeFirst() else { return }

        let tryCount = visited[element.red.x][element.red.y][element.blue.x][element.blue.y] + 1

        if tryCount > 10 {
            print(-1)
            return
        }

        // 상 좌 하 우
        for i in 0..<4 {
            var redPosition = element.red
            var bluePosition = element.blue

            var redInHole = false
            var blueInHole = false

            var firstMoveIsRed = true

            switch i {
            case 0:
                firstMoveIsRed = redPosition.x < bluePosition.x
            case 1:
                firstMoveIsRed = redPosition.y < bluePosition.y
            case 2:
                firstMoveIsRed = redPosition.x > bluePosition.x
            case 3:
                firstMoveIsRed = redPosition.y > bluePosition.y
            default:
                continue
            }

            if firstMoveIsRed {
                var newPosition = redPosition
                while map[newPosition.x][newPosition.y] != "#" {
                    redPosition = newPosition
                    if redPosition == hole {
                        redInHole = true
                        redPosition = (0, 0)
                        break
                    }
                    newPosition = (redPosition.x + moveX[i], redPosition.y + moveY[i])
                }

                newPosition = bluePosition
                while map[newPosition.x][newPosition.y] != "#"
                        && newPosition != redPosition {
                    bluePosition = newPosition
                    if bluePosition == hole {
                        blueInHole = true
                        break
                    }
                    newPosition = (bluePosition.x + moveX[i], bluePosition.y + moveY[i])
                }
            } else {
                var newPosition = bluePosition
                while map[newPosition.x][newPosition.y] != "#" {
                    bluePosition = newPosition
                    if bluePosition == hole {
                        blueInHole = true
                        bluePosition = (0, 0)
                        break
                    }
                    newPosition = (bluePosition.x + moveX[i], bluePosition.y + moveY[i])
                }

                newPosition = redPosition
                while map[newPosition.x][newPosition.y] != "#"
                        && newPosition != bluePosition {
                    redPosition = newPosition
                    if redPosition == hole {
                        redInHole = true
                        break
                    }
                    newPosition = (redPosition.x + moveX[i], redPosition.y + moveY[i])
                }
            }

            if redInHole {
                if !blueInHole {
                    print(tryCount)
                    return
                }
            } else {
                if !blueInHole {
                    if visited[redPosition.x][redPosition.y][bluePosition.x][bluePosition.y] == -1 {
                        queue.append((redPosition, bluePosition))
                        visited[redPosition.x][redPosition.y][bluePosition.x][bluePosition.y] = tryCount
                    }
                }
            }

        }

    }

    print(-1)


    struct Queue<T> {
        var elements: [T] = []
        var head: Int = 0
        var isEmpty: Bool { elements.count <= head }

        mutating func append(_ element: T) {
            elements.append(element)
        }

        mutating func removeFirst() -> T? {
            guard !isEmpty else { return nil }
            let value = elements[head]
            head += 1

            return value
        }

    }
}