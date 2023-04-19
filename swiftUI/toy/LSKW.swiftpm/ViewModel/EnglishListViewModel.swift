//
//  EnglishListViewModel.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/11.
//

import Foundation
class EnglishListViewModel : ObservableObject {
    @Published var modelList : [Model]

    init(modelList : [Model]) {
        self.modelList = modelList
    }
}
