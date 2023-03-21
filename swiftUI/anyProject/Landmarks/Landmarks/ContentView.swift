//
//  ContentView.swift
//  Landmarks
//
//  Created by 박승찬 on 2023/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turttle Rock")
                .font(.title)
            HStack {
                Text("뜽딴's Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("Korea")
                    .font(.subheadline)
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
