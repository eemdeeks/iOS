//
//  DoCatchTryThrow.swift
//  SwiftConcurrency
//
//  Created by 박승찬 on 3/20/24.
//

import SwiftUI

class DoCatchTryThrowDataManager {
    let isActive: Bool = true

    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("New Text!!", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }

    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("New Text!!")
        } else {
            return .failure(URLError(.appTransportSecurityRequiresSecureConnection))
        }
    }

    func getTitle3() throws -> String {
//        if isActive {
//            return "New Text!!"
//        } else {
            throw URLError(.badServerResponse)
//        }
    }

    func getTitle4() throws -> String {
        if isActive {
            return "Final Text!!"
        } else {
            throw URLError(.badServerResponse)
        }
    }
}

class DoCatchTryThrowViewModel: ObservableObject {
    @Published var text: String = "Start text"
    let manager = DoCatchTryThrowDataManager()

    func fetchTitle() {
        /*
        let returnedValue = manager.getTitle()
        if let newTitle = returnedValue.title {
            self.text = newTitle
        } else if let error = returnedValue.error {
            self.text = error.localizedDescription
        }
         */
        /*
        let result = manager.getTitle2()

        switch result {
        case .success(let newTitle):
            self.text = newTitle
        case .failure(let error):
            self.text = error.localizedDescription
        }
        */

//        let newTitle = try! manager.getTitle3()
//        self.text = newTitle

        do {
            let newTitle = try? manager.getTitle3()
            if let newTitle = newTitle {
                self.text = newTitle
            }

            let finalText = try manager.getTitle4()
            self.text = finalText
        } catch {
            self.text = error.localizedDescription
        }
    }
}
struct DoCatchTryThrow: View {
    @StateObject private var viewModel = DoCatchTryThrowViewModel()

    var body: some View {
        Text(viewModel.text)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}

#Preview {
    DoCatchTryThrow()
}
