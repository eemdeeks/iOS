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
    @State private var showUnSolvedOnly = false
    @State private var showUnSolvedOnly2 = false
    
    var filteredProblems: [Model] {
        viewModel.modelList.filter { problem in
            (!showUnSolvedOnly || problem.isSolved)
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Korean to English")) {
                    Toggle(isOn: $showUnSolvedOnly2){
                        Text("Unsolved only")
                    }
                    ForEach(viewModel2.modelList){ problem in
                        NavigationLink{
                            EnglishView(viewModel: EnglishViewModel(myAnswer: problem))
                        } label: {
                            EnglishRowView(viewModel: EnglishViewModel(myAnswer: problem))
                        }
                        
                    }
                }
                Section(header: Text("English to Korean")) {
                    Toggle(isOn: $showUnSolvedOnly){
                        Text("Unsolved only")
                    }
                    ForEach(viewModel.modelList){ problem in
                        NavigationLink{
                            KoreanView(viewModel: KoreanViewModel(myAnswer: problem))
                        } label: {
                            KoreanRowView(viewModel: KoreanViewModel(myAnswer: problem))
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
