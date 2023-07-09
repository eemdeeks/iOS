//
//  ContentView.swift
//  CloudKitProject
//
//  Created by 박승찬 on 2023/07/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                CloudKitUser()
                CloudKitCRUD()
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
