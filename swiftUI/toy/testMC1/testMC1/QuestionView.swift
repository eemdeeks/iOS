//
//  QuestionView.swift
//  testMC1
//
//  Created by 박승찬 on 2023/03/26.
//

import SwiftUI

struct QuestionView: View {
    var question: String
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text(question)
                Spacer()
            }
        }.frame(height: 100).border(.gray).padding(.horizontal)
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: "this is question")
    }
}
