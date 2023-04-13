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
    
    //var filteredProblems: [Model] {
    //    viewModel.modelList.filter { problem in
    //        (!viewModel.showUnSolvedOnly || problem.isSolved)
    //    }
    //}
    
    var body: some View {
        NavigationView{
            List{
                Section(header: Text("Korean to English")) {
                    //Toggle(isOn: $viewModel2.showUnSolvedOnly){
                    //    Text("Unsolved only")
                    //}
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
                    //Toggle(isOn: $viewModel.showUnSolvedOnly){
                    //    Text("Unsolved only")
                    //}
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
