//
//  MainViewModel.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/11.
//

import Foundation



class MainViewModel: UpdateProfileViewModelDelegate, ObservableObject {
    
    @Published var goToUpdateProfileView: Bool = false
    
    
    var profile: Profile
    
    init(profile: Profile) {
        self.profile = profile
        
    }
    func clickedUpdateProfileButton() {
        goToUpdateProfileView = true
    }

}

extension MainViewModel {
    func setProfile(profile: Profile) {
        self.profile = profile
        print("프로필 : \(profile)")
    }
}
