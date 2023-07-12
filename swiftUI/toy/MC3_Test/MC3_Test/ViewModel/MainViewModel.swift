//
//  MainViewModel.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/11.
//

import Foundation



class MainViewModel: UpdateProfileViewModelDelegate, ObservableObject {
    
    @Published var goToUpdateProfileView: Bool = false
    @Published var goToCreateRoomView: Bool = false
    
    @Published var profile: Profile
    
    @Published var rooms: [Room] = []
    
    init(profile: Profile) {
        self.profile = profile
        
    }
    
    func clickedUpdateProfileButton() {
        goToUpdateProfileView = true
    }
    
    func clickedCreateRoomButton() {
        goToCreateRoomView = true
    }

}

extension MainViewModel {
    func setProfile(profile: Profile) {
        self.profile = profile
        print("프로필 : \(profile)")
    }
}
