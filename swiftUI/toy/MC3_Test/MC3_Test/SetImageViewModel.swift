//
//  SetImageViewModel.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/10.
//

import Foundation
import CloudKit

class SetImageViewModel: ObservableObject {
    
    @Published var profile: Profile = Profile(UID: "", name: "", record: nil)
    init() {
        fetchUID()
    }
    
    // MARK: - Update
    func updateItem(profile: Profile) {
        fetchUID()
        if let record = profile.record{
            record["ImageKey"] = "Cat"
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
                        
                        DispatchQueue.main.async {
                            self?.profile = Profile(UID: id.recordName, name: name, record: record)
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
