//
//  QuestionList.swift
//  testMC1
//
//  Created by 박승찬 on 2023/03/26.
//

import SwiftUI

struct QuestionList: View {
    var question:[String] = ["만나서 반가워", "어쩌라고"]
    var body: some View {
        NavigationView(){
            VStack{
                Spacer()
                ForEach(question, id: \.self) { question in
                    NavigationLink{
                        SecondView()
                    } label:{
                        QuestionView(question: question)
                    }
                }
            }
            
        }
    }
}

struct QuestionList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionList()
    }
}

