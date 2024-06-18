//
//  BasicProtocol.swift
//  SwiftBasic
//
//  Created by 박승찬 on 6/18/24.
//

import SwiftUI

protocol Driveable {
    var speed: Int { get set }
    func speedDown(with downSpeed: Int)
}


class Kia: Driveable, ObservableObject {
    @Published var speed: Int
    init(speed: Int) {
        self.speed = speed
    }

    func speedDown(with downSpeed: Int) {
        speed -= downSpeed
    }

}

class Hyundai: Driveable, ObservableObject {
    var speed: Int
    init(speed: Int) {
        self.speed = speed
    }

    func speedDown(with downSpeed: Int) {
        speed -= downSpeed
    }
}

struct BasicProtocol: View {

    @StateObject var myCar: Kia = Kia(speed: 10)
    @StateObject var broCar: Hyundai = Hyundai(speed: 15)

    var cars: [Driveable] = [Kia(speed: 3), Hyundai(speed: 3)]

    var body: some View {
        VStack {
            Text("\(myCar.speed)")
            Button {
                myCar.speedDown(with: 3)
                for car in cars {
                    car.speedDown(with: 3)
                }
            } label: {
                Text("감속하기")
            }

        }
    }
}
#Preview {
    BasicProtocol()
}
