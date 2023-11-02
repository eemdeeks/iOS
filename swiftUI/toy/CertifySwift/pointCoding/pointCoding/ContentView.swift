//
//  ContentView.swift
//  pointCoding
//
//  Created by 박승찬 on 11/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AlarmTabView()
            .environment(\.colorScheme, .dark)
    }
}

#Preview {
    ContentView()
}
