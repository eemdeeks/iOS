//
//  KoreanListView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/09.
//

import SwiftUI

struct KoreanListView: View {
    @ObservedObject var viewModel : KoreanListViewModel
    @ObservedObject var viewModel2 : EnglishListViewModel
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Korean to English")) {
                    ForEach(viewModel2.modelList){ problem in
                        let problems = EnglishViewModel(myAnswer: problem)
                        NavigationLink{
                            EnglishView(viewModel: problems)
                        } label: {
                            EnglishRowView(viewModel: problems)
                        }
                    }
                }
                Section(header: Text("English to Korean")) {
                    ForEach(viewModel.modelList){ problem in
                        let problems = KoreanViewModel(myAnswer: problem)
                        NavigationLink{
                            KoreanView(viewModel: problems)
                        } label: {
                            KoreanRowView(viewModel: problems)
                        }             
                    }
                }
            }
            .navigationTitle("Let's learn Korean")
        }
    }
}

struct KoreanListView_Previews: PreviewProvider {
    static var previews: some View {
        KoreanListView(viewModel: KoreanListViewModel(modelList: Model.modelList),viewModel2: EnglishListViewModel(modelList: Model.modelList2))
    }
}
