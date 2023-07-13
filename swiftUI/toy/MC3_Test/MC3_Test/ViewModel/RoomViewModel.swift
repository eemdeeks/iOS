//
//  RoomViewModel.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/13.
//

import Foundation
import CloudKit

class RoomViewModel: ObservableObject {
    
    @Published var allUsers: [Profile]
    @Published var users: [Profile]
    @Published var roomInfo: Room
    
    init(allUsers: [Profile], users: [Profile], roomInfo: Room) {
        self.allUsers = allUsers
        self.users = users
        self.roomInfo = roomInfo
        
        fetchRoom()
        print("모든 유저 : \(allUsers.count)")
        print("방 유자: \(users.count)")
    }
    
    
    func fetchRoom() {
        CKContainer.default().fetchUserRecordID { [weak self] returnedID, returnedError in
            if let id = returnedID {
                let predicate = NSPredicate(format: "name = %@", argumentArray: ["\(self?.roomInfo.name)"])
                let query = CKQuery(recordType: "Room", predicate: predicate)
                let queryOperation = CKQueryOperation(query: query)
                
                queryOperation.recordMatchedBlock = {  (returnedRecordID, returnedResult) in
                    switch returnedResult {
                    case .success(let record):
                        guard let uids = record["uids"] as? [String] else { return }
                        DispatchQueue.main.async {
                            for uid in uids{
                                if let all = self?.allUsers {
                                    for user in all {
                                        if user.UID == uid {
                                            self?.users.append(Profile(UID: uid, name: user.name,imageKey: user.imageKey, record: user.record))
                                        }
                                    }
                                }
                                
                            }
                            
                        }
                    case .failure(let error):
                        print("Error recordMatchedBlock: \(error)")
                    }
                }
                
                queryOperation.queryResultBlock = { returnedResult in
                    print("Returned result: \(returnedResult)")
                    
                    
                }
                
                CKContainer.default().publicCloudDatabase.add(queryOperation)
            }
        }
        
    }}
