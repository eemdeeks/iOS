//
//  KoreanRowView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/09.
//

import SwiftUI

struct KoreanRowView: View{
    @ObservedObject var viewModel: KoreanViewModel
    
    var body: some View {
        HStack{
            if viewModel.answerBool {
                Image(systemName: "star.fill")
            }
            
            Text(viewModel.myAnswer.problem)
            
        }
    }
}

struct KoreanRowView_Previews: PreviewProvider {
    static var previews: some View {
        KoreanRowView(viewModel: KoreanViewModel(myAnswer: .story))
    }
}
