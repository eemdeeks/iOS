//
//  ContentView.swift
//  youngWS
//
//  Created by 박승찬 on 2023/09/26.
//

import SwiftUI

struct Memo: Identifiable {
    let id: String
    let title: String
    let text: String
}



struct ContentView: View {
    
    var memo: [Memo] = [Memo(id: UUID().uuidString, title: "QR코드 스캔", text: "똥꾸멍"),
                        Memo(id: UUID().uuidString, title: "QR코드 스캔", text: "똥꾸멍"),
                        Memo(id: UUID().uuidString, title: "QR코드 스캔", text: "똥꾸멍"),
                        Memo(id: UUID().uuidString, title: "QR코드 스캔", text: "똥꾸멍")
    ]
    
    let columns = [GridItem()]
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns) {
                ForEach(memo) { memo in
                    cell(memo: memo)
                }
            }
            .navigationTitle("Card")
        }
    }
    
    func cell(memo: Memo) -> some View {
        return HStack {
            VStack {
                Text(memo.title)
                Text(memo.text)
            }
        }
        .frame(height: 80)
        .frame(maxWidth: .infinity)
        .background(Color.gray)
        .padding()
    }
    
}

#Preview {
    ContentView()
}
