//
//  Model.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/10.
//

import Foundation
import CloudKit

class Profile {
    let UID: String
    var name: String
    var imageKey: String?
    let record: CKRecord?
    init(UID: String, name: String, imageKey: String? = nil, record: CKRecord?) {
        self.UID = UID
        self.name = name
        self.imageKey = imageKey
        self.record = record
    }
}
