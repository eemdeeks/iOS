//
//  RoundedButton.swift
//  calculator
//
//  Created by 박승찬 on 2023/06/16.
//

import SwiftUI

struct SymbolButtonLabel: View {
    
    @Binding var outPut: String
    @Binding var outPutSize: CGFloat
    
    @Binding var item: ButtonModel
    let geo: GeometryProxy
    
    let symbols: [String] = ["plus.forwardslash.minus","percent","equal"]
    let operators: [String] = ["divide","multiply","minus","plus"]
    let numbers: [String] = ["0","1","2","3","4","5","6","7","8","9"]

    var body: some View {
        Button {
            if numbers.contains(item.name){
                if outPut == "0"{
                    outPut = item.name
                } else {
                    outPut += item.name
                }
            } else if item.name == "AC" {
                outPut = "0"
            } else if item.name == "plus.forwardslash.minus"{
                if outPut.contains("-") {
                    outPut = outPut.replacingOccurrences(of: "-", with: "")
                } else {
                    outPut = "-" + outPut
                }
            } else if item.name == "." {
                if !outPut.contains(".") {
                    outPut += "."
                }
            } else if item.name == "percent" {
                guard outPut != "0" else { return }
                guard outPut != "-0" else {
                    outPut = "0"
                    return
                }
                var num = Float(outPut)!
                num /= 100
                outPut = String(num)
            }
            
            switch outPut.count {
            case 7:
                outPutSize = 80
            case 8:
                outPutSize = 70
            case 9:
                outPutSize = 60
            case 10:
                outPut.removeLast()
            default:
                outPutSize = 90
            }
            
            if operators.contains(item.name){
                item.isClicked = !(item.isClicked ?? false)
            }
            
        } label: {
            if symbols.contains(item.name) {
                Image(systemName: item.name)
                    .font(.system(size: 30))
                    .foregroundColor(item.foregroundColor)
                    .padding()
                    .frame(width: geo.size.width/5 ,height: geo.size.width/5)
                    .background(item.backgroundColor)
                    .clipShape(Circle())
                    .padding(5)
            } else if operators.contains(item.name) {
                if item.isClicked ?? false {
                    Image(systemName: item.name)
                        .font(.system(size: 30))
                        .foregroundColor(.orange)
                        .padding()
                        .frame(width: geo.size.width/5 ,height: geo.size.width/5)
                        .background(.white)
                        .clipShape(Circle())
                        .padding(5)
                } else {
                    Image(systemName: item.name)
                        .font(.system(size: 30))
                        .foregroundColor(item.foregroundColor)
                        .padding()
                        .frame(width: geo.size.width/5 ,height: geo.size.width/5)
                        .background(item.backgroundColor)
                        .clipShape(Circle())
                        .padding(5)
                }
            } else if item.name == "0" {
                Text(item.name)
                    .frame(width: geo.size.width/4 ,alignment: .leading)
                    .font(.system(size: 35))
                    .foregroundColor(item.foregroundColor)
                    .padding()
                    .frame(width: geo.size.width*2/5 + 10 ,height: geo.size.width/5)
                    .background(item.backgroundColor)
                    .cornerRadius(100)
                    .padding(5)
            } else if item.name == "AC" {
                if outPut == "0" || outPut == "-0"{
                    Text("AC")
                        .font(.system(size: 35))
                        .foregroundColor(item.foregroundColor)
                        .padding()
                        .frame(width: geo.size.width/5 ,height: geo.size.width/5)
                        .background(item.backgroundColor)
                        .clipShape(Circle())
                        .padding(5)
                } else {
                    Text("C")
                        .font(.system(size: 35))
                        .foregroundColor(item.foregroundColor)
                        .padding()
                        .frame(width: geo.size.width/5 ,height: geo.size.width/5)
                        .background(item.backgroundColor)
                        .clipShape(Circle())
                        .padding(5)
                }
            } else {
                Text(item.name)
                    .font(.system(size: 35))
                    .foregroundColor(item.foregroundColor)
                    .padding()
                    .frame(width: geo.size.width/5 ,height: geo.size.width/5)
                    .background(item.backgroundColor)
                    .clipShape(Circle())
                    .padding(5)
            }
        }
        
    }
        
}
