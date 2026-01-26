//
//  15685.swift
//  AlgorithmStudy
//
//  Created by 박승찬 on 1/26/26.
//

// 구현, 시뮬레이션
func solution15685() {
    let fileIO = FileIO()

    let n = fileIO.readInt()
    var x: Int  // 시작점 x좌표
    var y: Int  // 시작점 y좌표
    var d: Int  // 시작 방향
    var g: Int  // 세대

    var plane: [[Bool]] = Array(repeating: Array(repeating: false, count: 102), count: 102)   // [y좌표][x좌표]

    for _ in 0..<n {
        x = fileIO.readInt()
        y = fileIO.readInt()
        d = fileIO.readInt()
        g = fileIO.readInt()
        makeDragonCurve(x, y, d, g)
    }

    var answer: Int = 0
    for x in 0..<101 {
        for y in 0..<101 {
            if plane[y][x] {
                if plane[y + 1][x] && plane[y + 1][x + 1] && plane[y][x + 1] {
                    answer += 1
                }
            }
        }
    }
    
    print(answer)

    func makeDragonCurve(_ x: Int, _ y: Int, _ d: Int, _ g: Int) {
        func makeCurve(_ ds: [Int], count: Int) -> [Int] {
            if count == 0 {
                return ds
            }

            var newDs: [Int] = []

            for i in ds.reversed() {
                newDs.append((i + 1) % 4)
            }

            return makeCurve(ds + newDs, count: count - 1)
        }


        plane[y][x] = true
        var lastPoint: (y: Int, x: Int) = (y, x)
        for makeD in makeCurve([d], count: g) {
            switch makeD {
            case 0:
                lastPoint = (lastPoint.y, lastPoint.x + 1)
            case 1:
                lastPoint = (lastPoint.y - 1, lastPoint.x)
            case 2:
                lastPoint = (lastPoint.y, lastPoint.x - 1)
            default:
                lastPoint = (lastPoint.y + 1, lastPoint.x)
            }
            plane[lastPoint.y][lastPoint.x] = true
        }

    }

}
