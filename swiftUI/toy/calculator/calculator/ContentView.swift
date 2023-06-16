//
//  ContentView.swift
//  calculator
//
//  Created by 박승찬 on 2023/06/16.
//

import SwiftUI

struct ContentView: View {
    @State var outPut: Int = 0
    let buttonModel: [[ButtonModel]] = [
        [.ac,.plusMinus,.percent,.divide],
        [.seven,.eight,.nine,.multiply],
        [.four,.five,.six,.minus],
        [.one,.two,.three,.plus],
        [.zero,.point,.equal]
    ]
    var body: some View {
        GeometryReader{ geo in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(String(outPut))
                        .font(.system(size: 80))
                        .padding()
                }
                ForEach(buttonModel, id: \.self){ models in
                    HStack{
                        ForEach(models, id: \.self){ label in
                            Button{
                                
                            } label: {
                                SymbolButtonLabel(name: label.name, backColor: label.backgroundColor, foregroundColor: label.foregroundColor, geo: geo)
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
