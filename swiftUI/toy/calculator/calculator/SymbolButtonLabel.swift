//
//  RoundedButton.swift
//  calculator
//
//  Created by 박승찬 on 2023/06/16.
//

import SwiftUI

struct SymbolButtonLabel: View {
    let name: String
    let backColor: Color
    let foregroundColor: Color
    let geo: GeometryProxy
    
    let symbols: [String] = ["plus.forwardslash.minus","percent","divide","multiply","minus","plus","equal"]
    
    var body: some View {
        if symbols.contains(name) {
            Image(systemName: name)
                .font(.system(size: 30))
                .foregroundColor(foregroundColor)
                .padding()
                .frame(width: geo.size.width/5 ,height: geo.size.width/5)
                .background(backColor)
                .clipShape(Circle())
                .padding(5)
        } else if name == "0" {
            Text(name)
                .frame(width: geo.size.width/4 ,alignment: .leading)
                .font(.system(size: 35))
                .foregroundColor(foregroundColor)
                .padding()
                .frame(width: geo.size.width*2/5 + 10 ,height: geo.size.width/5)
                .background(backColor)
                .cornerRadius(100)
                .padding(5)
        } else {
            Text(name)
                .font(.system(size: 35))
                .foregroundColor(foregroundColor)
                .padding()
                .frame(width: geo.size.width/5 ,height: geo.size.width/5)
                .background(backColor)
                .clipShape(Circle())
                .padding(5)
        }
    }
        
}
