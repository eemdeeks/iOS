//
//  KoreanListView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/09.
//

import SwiftUI

struct KoreanListView: View {
    @ObservedObject var viewModel : KoreanListViewModel
    @State private var showUnSolvedOnly = false
    
    var filteredProblems: [Model] {
        viewModel.modelList.filter { problem in
            (!showUnSolvedOnly || problem.isSolved)
        }
    }
    
    var body: some View {
        NavigationView{
            List{
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
            .navigationTitle("English to Korean")
        }
    }
}

struct KoreanListView_Previews: PreviewProvider {
    static var previews: some View {
        KoreanListView(viewModel: KoreanListViewModel(modelList: Model.modelList))
    }
}
