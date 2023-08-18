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
                .font(.custom(.dovemayo, size: 20))
            Spacer()
            // 문제를 풀었을 경우 이미지 표시
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
