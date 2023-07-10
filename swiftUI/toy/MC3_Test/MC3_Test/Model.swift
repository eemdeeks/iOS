//
//  Model.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/10.
//

import Foundation
import CloudKit

struct Profile: Hashable {
    let UID: String
    let name: String
    let record: CKRecord?
}
