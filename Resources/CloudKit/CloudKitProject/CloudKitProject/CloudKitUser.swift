//
//  CloudKitUser.swift
//  CloudKitProject
//
//  Created by 박승찬 on 2023/07/09.
//

import SwiftUI
import CloudKit

class CloudKitUserViewModel: ObservableObject {
    
    @Published var permissionStatus: Bool = false
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    
    init() {
        getiCloudStatus()
        requestPermission()
        fetchiCloudUserRecordID()
    }
    
    
    // MARK: - User의 iCloud계정 가져오기
    // 고유의 iCloud 계정이 데이터 베이스에 저장돼요.
    private func getiCloudStatus() {
        CKContainer.default().accountStatus{ [weak self] returnedStatus, returnedError in   //비동기 코드를 사용하고 있기 때문에 weak self 사용
            DispatchQueue.main.async {
                switch returnedStatus {
                case .available:
                    self?.isSignedInToiCloud = true
                case .noAccount:
                    self?.error = CloudKitError.iCloudAccountNotFound.rawValue
                case .couldNotDetermine:
                    self?.error = CloudKitError.iCloudAccountNotDetermined.rawValue
                case .restricted:
                    self?.error = CloudKitError.iCloudAccountRestricted.rawValue
                default:
                    self?.error = CloudKitError.iCloudAccountUnknown.rawValue
                }
            }
        }
    }
    
    // 계정을 가져오지 못했을 경우의 에러메시지들
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
    }
    
    // iCloud계정에서 가저온 이름을 fetch하는 함수에요!
    func fetchiCloudUserRecordID() {
        CKContainer.default().fetchUserRecordID { [weak self] returnedID, returnedError in
            if let id = returnedID{
                self?.discoveriCloudUser(id: id)
            }
        }
    }
    
    // 사용자의 이름을 가져올 수 있도록 접근 권한을 물어보는 함수에요!
    func requestPermission() {
        CKContainer.default().requestApplicationPermission([.userDiscoverability]) { [weak self] returnedStatus, returnedError in
            DispatchQueue.main.async {
                if returnedStatus == .granted{
                    self?.permissionStatus = true
                }
            }
        }
    }
    
    // iCloud계정에서 userName 가져오는 함수에요!
    func discoveriCloudUser(id: CKRecord.ID) {
        // UserID를 통해서 데이터 가져오기
        CKContainer.default().discoverUserIdentity(withUserRecordID: id) { [weak self] returnedIdentity, returnedError in
            DispatchQueue.main.async {
                if let name = returnedIdentity?.nameComponents?.givenName {
                    self?.userName = name
                }
                
                // 아래 코드를 통해서 이메일이나 전화번호등을 가져올 수도 있어요.
                //returnedIdentity?.lookupInfo?.emailAddress
            }
        }
    }
}

struct CloudKitUser: View {
    
    @StateObject private var vm = CloudKitUserViewModel()
    
    var body: some View {
        VStack{
            Text("Is Signed In: \(vm.isSignedInToiCloud.description.uppercased())")
            Text(vm.error)
            Text("Permission: \(vm.permissionStatus.description.uppercased())")
            Text("NAME: \(vm.userName)")
        }
    }
}

struct CloudKitUser_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitUser()
    }
}
