//
//  KoreanListViewModel.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/09.
//

import Foundation
class KoreanListViewModel : ObservableObject{
    @Published var modelList: [Model]
    @Published var showUnSolvedOnly : Bool
    
    init(modelList: [Model], showUnSolvedOnly : Bool = false) {
        self.modelList = modelList
        self.showUnSolvedOnly = showUnSolvedOnly
    }
    
}
