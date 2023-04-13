//
//  EnglishListViewModel.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/11.
//

import Foundation
class EnglishListViewModel : ObservableObject {
    @Published var modelList : [Model]
    @Published var showUnSolvedOnly : Bool
    
    
    init(modelList : [Model], showUnSolbedOnly : Bool = false) {
        self.modelList = modelList
        self.showUnSolvedOnly = showUnSolbedOnly
    }
}
