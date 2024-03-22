//
//  ContentView.swift
//  SwiftConcurrency
//
//  Created by 박승찬 on 3/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DownloadImageAsync()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
