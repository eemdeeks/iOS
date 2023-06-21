//
//  ContentView.swift
//  Calculator
//
//  Created by 김수인 on 2023/06/10.
//

import SwiftUI

enum ButtonType: String {
    case one, two, three, four, five, six, seven, eight, nine, zero
    case point, equal, plus, minus, multiply, divide
    case clear, opposite, percent
    
    var buttonName: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .zero:
            return "0"
        case .point:
            return "."
        case .equal:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "X"
        case .divide:
            return "/"
        case .clear:
            return "AC"
        case .opposite:
            return "+/-"
        case .percent:
            return "%"
        }
    }
    var backgroundColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .point:
            return Color("NumberColor")
        case .equal, .plus, .minus, .multiply, .divide:
            return Color.orange
        case .clear, .opposite, .percent:
            return Color.gray
        }
    }
    var foregroundColor: Color {
        switch self {
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .point, .equal, .plus, .minus, .multiply, .divide:
            return Color.white
        case .clear, .opposite, .percent:
            return Color.black
        }
    }
    var imageName: String {
        switch self {
        case .opposite:
            return "plus.forwardslash.minus"
        case .divide:
            return "divide"
        case .multiply:
            return "multiply"
        case .minus:
            return "minus"
        case .plus:
            return "plus"
        case .equal:
            return "equal"
        default:
            return "?"
        }
    }
}


struct Suin2hi: View {
    
    @State private var calculateNumber: String = "0"

    private let buttonName: [[ButtonType]] = [
        [.clear, .opposite, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .point, .equal]]
    
    var body: some View {
        ZStack {
            // 배경설정
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(calculateNumber)
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .padding(.trailing)
                }
                
                ForEach(buttonName, id: \.self) { i in
                    HStack {
                        ForEach(i, id: \.self) { item in
                            
                            Button {
                                if item == .clear {
                                    calculateNumber = "0"
                                }
                                else if item == .opposite {
                                    if calculateNumber.contains("-") {
                                        calculateNumber = calculateNumber.replacingOccurrences(of: "-", with: "")
                                    }
                                    else {
                                        calculateNumber = "-" + calculateNumber
                                    }
                                }
                                else if item == .point {
                                    if calculateNumber.contains(".") {

                                    }
                                    else {
                                        calculateNumber = calculateNumber + "."
                                    }
                                }

                                else if item == .one || item == .two || item == .three || item == .four || item == .five || item == .six || item == .seven || item == .eight || item == .nine || item == .zero {
                                    if calculateNumber == "0" {
                                        calculateNumber = item.buttonName
                                    }
                                    else if calculateNumber == "-0" {
                                        calculateNumber = "-" + item.buttonName
                                    }
                                    else {
                                        calculateNumber += item.buttonName
                                    }
                                }

                            } label: {
                                if item == .opposite || item == .divide || item == .multiply || item == .minus || item == .plus || item == .equal {
                                    Image(systemName: item.imageName)
                                        .frame(width: 80, height: 80)
                                        .foregroundColor(item.foregroundColor)
                                        .background(item.backgroundColor)
                                        .cornerRadius(40)
                                        .font(.system(size: 33))
                                }
                                else {
                                    Text(item.buttonName)
                                        .frame(width: item == .some(.zero) ? 160 : 80, height: 80)
                                        .foregroundColor(item.foregroundColor)
                                        .background(item.backgroundColor)
                                        .cornerRadius(40)
                                        .font(.system(size: 33))
                                }

                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct Suin2hi_Previews: PreviewProvider {
    static var previews: some View {
        Suin2hi()
    }
}
