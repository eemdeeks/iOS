//
//  CloudKitCRUD.swift
//  CloudKitProject
//
//  Created by 박승찬 on 2023/07/09.
//

import SwiftUI
import CloudKit

struct FruitModel: Hashable {
    let name: String
    let record: CKRecord
}

class CloudKitCRUDViewModel: ObservableObject {
    
    @Published var text: String = ""
    @Published var fruits: [FruitModel] = []
    
    init() {
        fetchItem()
    }
    
    // add 버튼 누르면 아이템 추가하는 함수에요
    func addButtonPressed() {
        guard !text.isEmpty else { return }     // textField가 비워있는 경우를 방지해주는 코드에요.
        addItem(name: text)
    }
    
    // 아이템을 추가하는 함수에요
    private func addItem(name: String) {
        let newFruit = CKRecord(recordType: "Fruit")    // Fruit이라는 레코드 타입으로 넣어주는데 데이터베이스에 만약 Fruit이라는 레코드 타입이 없다면 만들어서 넣어줘요
        newFruit["name"] = name
        saveItem(record: newFruit)
        
    }
    
    private func saveItem(record: CKRecord) {
        CKContainer.default().publicCloudDatabase.save(record) { [weak self] returnedRecord, returnedError in
            print("Record: \(returnedRecord)")
            print("Error: \(returnedError)")
            
            DispatchQueue.main.async {
                self?.text = ""     // add 후에는 텍스트필드 비워주는 코드에요
                
                self?.fetchItem()   // refetch해서 update 후 뷰에 새로 바뀐 데이터베이스 보여주기
            }
        }
    }
    
    // 아이템 리스트 가져오는 함수에요
    func fetchItem() {
        
        //let predicate = NSPredicate(value: true)
        let predicate = NSPredicate(format: "name = %@", argumentArray: ["Coconut"])    // name에 Coconut인 것들만 필터링 해줄 수 있습니다.
        let query = CKQuery(recordType: "Fruit", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]    // 쿼리 받아올때 정렬해주는 방법, 쿼리 자체를 정렬해줘요!
        
        
//        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]    // 쿼리 받아올때 정렬해주는 방법 (만든 날짜로)
        
        let queryOperation = CKQueryOperation(query: query)
        
//        queryOperation.resultsLimit = 2 //쿼리를 최대 2개만 가져오게 하는 방법이에요!
        // 설정하지 않는다면 기본 100개의 쿼리만 반환 돼요!
        
        var returnedItems: [FruitModel] = []
        
        
        // iOS 버전 15미만일 경우 구현방법이에요
//        if #available(iOS 15.0, *) {
//            queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
//                switch returnedResult {
//                case .success(let record):
//                    guard let name = record["name"] as? String else { return }
//                    returnedItems.append(name)
//
//                case .failure(let error):
//                    print("Error recordMatchedBlock: \(error)")
//                }
//            }
//        } else {
//            queryOperation.recordFetchedBlock = { (returnedRecord) in
//                guard let name = returnedRecord["name"] as? String else { return }
//                returnedItems.append(name)
//            }
//        }
        
        
        
        queryOperation.recordMatchedBlock = { (returnedRecordID, returnedResult) in
            switch returnedResult {
            case .success(let record):
                guard let name = record["name"] as? String else { return }
                returnedItems.append(FruitModel(name: name, record: record))
                print("아이템")
            case .failure(let error):
                print("Error recordMatchedBlock: \(error)")
            }
        }
        
        // iOS 버전 15미만일 경우 구현방법이에요
        // if #available(iOS 15.0, *){
//            queryOperation.queryResultBlock = { returnedResult in
//                print("Returned result: \(returnedResult)")
//
//            }
        //} else {
//        queryOperation.queryCompletionBlock = { (returnedCursor, returnedError) in
//            print("Returned queryCompletionBlock")
//        }
        //}
        
        
        queryOperation.queryResultBlock = { [weak self] returnedResult in
            print("Returned result: \(returnedResult)")
            DispatchQueue.main.async {
                self?.fruits = returnedItems
            }
            
        }
        
        
        addOperations(operation: queryOperation)
    }
    
    func addOperations(operation: CKDatabaseOperation) {
        CKContainer.default().publicCloudDatabase.add(operation)
    }
    
    
    // MARK: - Update
    func updateItem(fruit: FruitModel) {
        let record = fruit.record
        record["name"] = "NEW NAME!!!!"
        saveItem(record: record)
    }
    
    // MARK: - Delete
    func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let fruit = fruits[index]
        let record = fruit.record
        
        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { [weak self] returnedRecordID, returnedError in
            DispatchQueue.main.async {
                self?.fruits.remove(at: index)
            }
        }
    }
}
struct CloudKitCRUD: View {
    
    @StateObject private var vm = CloudKitCRUDViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                header
                textField
                addButton
                List{
                    ForEach(vm.fruits, id:\.self) { fruit in
                        Text(fruit.name)
                            .onTapGesture {
                                vm.updateItem(fruit: fruit)
                            }
                    }
                    .onDelete(perform: vm.deleteItem)
                }
                .listStyle(PlainListStyle())
            }
            .padding()
            .navigationBarHidden(true)
        }
        
    }
}

extension CloudKitCRUD {
    private var header: some View {
        Text("CloudKit Project")
            .font(.headline)
            .underline()
    }
    
    private var textField: some View {
        TextField("Add something here..", text: $vm.text)
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var addButton: some View {
        Button {
            vm.addButtonPressed()
        } label: {
            Text("Add")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.pink)
                .cornerRadius(10)
                
        }
    }
}

struct CloudKitCRUD_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitCRUD()
    }
}

