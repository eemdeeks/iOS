//
//  ButtonModel.swift
//  calculator
//
//  Created by 박승찬 on 2023/06/16.
//

import Foundation
import SwiftUI

struct ButtonModel: Hashable {
    var name: String
    let backgroundColor: Color
    let foregroundColor: Color
    init(name: String, backgroundColor: Color, foregroundColor: Color) {
        self.name = name
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
    }
}

extension ButtonModel {
    static let ac = ButtonModel(name: "AC", backgroundColor: .gray, foregroundColor: .black)
    static let plusMinus = ButtonModel(name: "plus.forwardslash.minus", backgroundColor: .gray, foregroundColor: .black)
    static let percent = ButtonModel(name: "percent", backgroundColor: .gray, foregroundColor: .black)
    static let divide = ButtonModel(name: "divide", backgroundColor: .orange, foregroundColor: .white)
    static let multiply = ButtonModel(name: "multiply", backgroundColor: .orange, foregroundColor: .white)
    static let minus = ButtonModel(name: "minus", backgroundColor: .orange, foregroundColor: .white)
    static let plus = ButtonModel(name: "plus", backgroundColor: .orange, foregroundColor: .white)
    static let equal = ButtonModel(name: "equal", backgroundColor: .orange, foregroundColor: .white)
    static let zero = ButtonModel(name: "0", backgroundColor: Color("Darkgray"), foregroundColor: .white)
    static let one = ButtonModel(name: "1", backgroundColor: Color("Darkgray"), foregroundColor: .white)
    static let two = ButtonModel(name: "2", backgroundColor: Color("Darkgray"), foregroundColor: .white)
    static let three = ButtonModel(name: "3", backgroundColor: Color("Darkgray"), foregroundColor: .white)
    static let four = ButtonModel(name: "4", backgroundColor: Color("Darkgray"), foregroundColor: .white)
    static let five = ButtonModel(name: "5", backgroundColor: Color("Darkgray"), foregroundColor: .white)
    static let six = ButtonModel(name: "6", backgroundColor: Color("Darkgray"), foregroundColor: .white)
    static let seven = ButtonModel(name: "7", backgroundColor: Color("Darkgray"), foregroundColor: .white)
    static let eight = ButtonModel(name: "8", backgroundColor: Color("Darkgray"), foregroundColor: .white)
    static let nine = ButtonModel(name: "9", backgroundColor: Color("Darkgray"), foregroundColor: .white)
    static let point = ButtonModel(name: ".", backgroundColor: Color("Darkgray"), foregroundColor: .white)
}
