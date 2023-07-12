//
//  UpdateProfileViewModel.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/11.
//

import Foundation
import CloudKit

protocol UpdateProfileViewModelDelegate: AnyObject {
    func setProfile(profile: Profile)
}

class UpdateProfileViewModel: ObservableObject {
    
    @Published var profileImage: String = ""
    @Published var profileName: String = ""
    
    weak var delegate: UpdateProfileViewModelDelegate?
    
    @Published var profile: Profile
    
    init(profile: Profile, delegate: UpdateProfileViewModelDelegate) {
        self.profile = profile
        self.profileName = profile.name
        self.profileImage = profile.imageKey ?? ""
        self.delegate = delegate
        fetchUID()
        
    }
    
    // MARK: - Update
    private func updateItem(profile: Profile) {
        fetchUID()
        if let record = profile.record{
            self.profile.imageKey = self.profileImage
            self.profile.name = self.profileName
            
            record["name"] = self.profileName
            record["ImageKey"] = self.profileImage
            
            
            saveItem(record: record)
            print("업데이트")
            
        }
    }
    
    private func saveItem(record: CKRecord) {
        CKContainer.default().publicCloudDatabase.save(record) { returnedRecord, returnedError in
            print("Record: \(returnedRecord)")
            print("Error: \(returnedError)")
            
        }
    }
    
    func fetchUID() {
        CKContainer.default().fetchUserRecordID { [weak self] returnedID, returnedError in
            if let id = returnedID {
                let predicate = NSPredicate(format: "uid = %@", argumentArray: ["\(id.recordName)"])
                let query = CKQuery(recordType: "Profile", predicate: predicate)
                let queryOperation = CKQueryOperation(query: query)
                
                
                queryOperation.recordMatchedBlock = {  (returnedRecordID, returnedResult) in
                    switch returnedResult {
                    case .success(let record):
                        guard let name = record["name"] as? String else { return }
                        print("이름 가져오기 성공")
                        guard let image = record["ImageKey"] as? String else { return }
                        print("image가져오기 성공")
                        DispatchQueue.main.async {
                            self?.profile = Profile(UID: id.recordName, name: name, imageKey: image, record: record)
                        }
                    case .failure(let error):
                        print("Error recordMatchedBlock: \(error)")
                    }
                }
                
                queryOperation.queryResultBlock = { [weak self] returnedResult in
                    print("Returned result: \(returnedResult)")
                    DispatchQueue.main.async {
                        self?.profileName = self?.profile.name ?? ""
                        self?.profileImage = self?.profile.imageKey ?? ""
                    }
                    
                    
                }
                
                CKContainer.default().publicCloudDatabase.add(queryOperation)
            }
        }
        
    }
    
    func clickedSaveButton() {
        guard !profileName.isEmpty else { return }
        updateItem(profile: profile)
        
        delegate?.setProfile(profile: profile)
    
    }
}
