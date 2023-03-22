//
//  ContentView.swift
//  Landmarks
//
//  Created by 박승찬 on 2023/03/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage()
                .offset(y: -200).padding(.bottom, -250)
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
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }.padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
