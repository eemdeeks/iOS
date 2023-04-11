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
            Text(viewModel.myAnswer.problem)
            Spacer()
            if viewModel.myAnswer.isSolved {
                Image(systemName: "pencil.circle")
                    .foregroundColor(.green)
            }
        }
    }
}

struct KoreanRowView_Previews: PreviewProvider {
    static var previews: some View {
        KoreanRowView(viewModel: KoreanViewModel(myAnswer: .story))
    }
}
