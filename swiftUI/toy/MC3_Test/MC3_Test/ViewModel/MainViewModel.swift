//
//  MainViewModel.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/11.
//

import Foundation
import CloudKit


class MainViewModel: UpdateProfileViewModelDelegate, ObservableObject {
    
    @Published var goToUpdateProfileView: Bool = false
    @Published var goToCreateRoomView: Bool = false
    
    @Published var allUsers: [Profile] = []
    @Published var profile: Profile
    
    @Published var rooms: [Room] = []
    
    init(profile: Profile) {
        self.profile = profile
        fetchItem()
        fetchAllUsers()
    }
    
    func clickedUpdateProfileButton() {
        goToUpdateProfileView = true
    }
    
    func clickedCreateRoomButton() {
        goToCreateRoomView = true
    }
    
    // 방 리스트를 가져오는 함수에요
    func fetchItem() {
        CKContainer.default().fetchUserRecordID { [weak self] returnedID, returnedError in
            if let id = returnedID {
                let predicate = NSPredicate(value: true)
                let query = CKQuery(recordType: "Room", predicate: predicate)
                //query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]    // 쿼리 받아올때 정렬해주는 방법, 쿼리 자체를 정렬해줘요!
                                
                let queryOperation = CKQueryOperation(query: query)
                
                //                queryOperation.resultsLimit = 2 //쿼리를 최대 2개만 가져오게 하는 방법이에요!
                // 설정하지 않는다면 기본 100개의 쿼리만 반환 돼요!
                
                var returnedItems: [Room] = []
                
                
                
                
                queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
                    switch returnedResult {
                    case .success(let record):
                        guard let name = record["name"] as? String else { return }
                        guard let uids = record["uids"] as? [String] else { return }
                        if uids.contains(id.recordName){
                            returnedItems.append(Room(name: name, UIDs: uids, record: record))
                        }
                        print(uids)
                        
                    case .failure(let error):
                        print("Error recordMatchedBlock: \(error)")
                    }
                }
                print(returnedItems)
                
                queryOperation.queryResultBlock = { [weak self] returnedResult in
                    print("Returned result: \(returnedResult)")
                    DispatchQueue.main.async {
                        self?.rooms = returnedItems
                    }
                    
                }
                CKContainer.default().publicCloudDatabase.add(queryOperation)
            }
        }
    }
    
//    func addOperations(operation: CKDatabaseOperation) {
//        CKContainer.default().publicCloudDatabase.add(operation)
//    }
    
    func fetchAllUsers() {
        CKContainer.default().fetchUserRecordID { [weak self] returnedID, returnedError in
            if let id = returnedID {
                let predicate = NSPredicate(value: true)
                let query = CKQuery(recordType: "Profile", predicate: predicate)
                let queryOperation = CKQueryOperation(query: query)
                
                queryOperation.recordMatchedBlock = {  (returnedRecordID, returnedResult) in
                    switch returnedResult {
                    case .success(let record):
                        guard let name = record["name"] as? String else { return }
                        guard let uid = record["uid"] as? String else { return }
                        guard let imageKey = record["ImageKey"] as? String else { return }
                        
                        if id.recordName != uid {
                            DispatchQueue.main.async {
                                self?.allUsers.append(Profile(UID: uid, name: name,imageKey: imageKey, record: record))
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
        
    }
}

extension MainViewModel {
    func setProfile(profile: Profile) {
        self.profile = profile
        print("프로필 : \(profile)")
    }
}
