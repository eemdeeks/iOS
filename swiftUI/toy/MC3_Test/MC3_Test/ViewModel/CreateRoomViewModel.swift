//
//  CreateRoomViewModel.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/12.
//

import Foundation
import CloudKit

class CreateRoomViewModel: ObservableObject {
    @Published var roomName: String = ""
    
    
    
    private func createRoom(roomName: String) {
        CKContainer.default().fetchUserRecordID { [weak self] returnedID, returnedError in
            if let uid = returnedID {
                let room = CKRecord(recordType: "Room")
                
                room["name"] = roomName
                room["uids"] = [uid.recordName]
                
                self?.saveItem(record: room)
            }
        }
    }
    
    private func saveItem(record: CKRecord) {
        CKContainer.default().publicCloudDatabase.save(record) { returnedRecord, returnedError in
            print("Record: \(returnedRecord)")
            print("Error: \(returnedError)")
            
        }
    }
    
    func clickedCompleteButton() {
        guard !roomName.isEmpty else { return }
        createRoom(roomName: roomName)
        
    }
}
