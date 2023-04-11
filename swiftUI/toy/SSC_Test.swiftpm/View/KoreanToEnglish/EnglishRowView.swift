//
//  EnglishRowView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/11.
//

import SwiftUI

struct EnglishRowView: View {
    @ObservedObject var viewModel: EnglishViewModel
    
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

struct EnglishRowView_Previews: PreviewProvider {
    static var previews: some View {
        EnglishRowView(viewModel: EnglishViewModel(myAnswer: .change))
    }
}
