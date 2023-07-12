//
//  Model.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/10.
//

import Foundation
import CloudKit

struct Profile {
    let UID: String
    var name: String
    var imageKey: String?
    let record: CKRecord?
}

struct Room {
    let name: String
    let UIDs: [String]
    let record: CKRecord?
}
