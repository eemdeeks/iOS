//
//  RoundedNumberButton.swift
//  calculator
//
//  Created by 박승찬 on 2023/06/16.
//

import SwiftUI

struct RoundedNumberButton: View {
    var body: some View {
        Button{
            
        } label: {
            
            Image(systemName: number)
                .font(.system(size: 50))
                .foregroundColor(foregroundColor)
                .padding()
                .frame(width: geo.size.width/5 ,height: geo.size.width/5)
                .background(backColor)
                .clipShape(Circle())
            
        }
        .padding(5)
    }
}

//struct RoundedNumberButton_Previews: PreviewProvider {
//    static var previews: some View {
//        RoundedNumberButton()
//    }
//}
