//
//  SessionPagingView.swift
//  WorkoutProject Watch App
//
//  Created by 박승찬 on 10/30/23.
//

import SwiftUI

struct SessionPagingView: View {
    @State private var selection: Tab = .metrics

    enum Tab {
        case controls, metrics, nowPlaying
    }
    var body: some View {
        TabView(selection: $selection,
                content:  {
            Text("Controls").tag(Tab.controls)
            Text("Metrics").tag(Tab.metrics)
            Text("Now Playing").tag(Tab.nowPlaying)
        })
    }
}

#Preview {
    SessionPagingView()
}
