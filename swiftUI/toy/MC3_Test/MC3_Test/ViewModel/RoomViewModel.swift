//
//  RoomViewModel.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/13.
//

import Foundation

class RoomViewModel: ObservableObject {
    
    @Published var users: [Profile]
    @Published var roomInfo: Room
    
    init(users: [Profile], roomInfo: Room) {
        self.users = users
        self.roomInfo = roomInfo
    }
    
    
}
