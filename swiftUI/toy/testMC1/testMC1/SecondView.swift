//
//  SecondView.swift
//  testMC1
//
//  Created by 박승찬 on 2023/03/25.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack{
            Spacer()
            VStack{
                NavigationLink(destination:QuestionList()){
                    Text("Skip")
                }
                TalkView()
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
