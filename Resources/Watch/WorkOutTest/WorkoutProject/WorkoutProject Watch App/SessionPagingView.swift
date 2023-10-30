//
//  SessionPagingView.swift
//  WorkoutProject Watch App
//
//  Created by 박승찬 on 10/30/23.
//

import SwiftUI
import WatchKit

struct SessionPagingView: View {
    @Environment(\.isLuminanceReduced) var isLuminaceReduced
    @EnvironmentObject var workoutManager: WorkoutManager
    @State private var selection: Tab = .metrics

    enum Tab {
        case controls, metrics, nowPlaying
    }
    var body: some View {
        TabView(selection: $selection,
                content:  {
            ControlsView().tag(Tab.controls)
            MetricsView().tag(Tab.metrics)
            NowPlayingView().tag(Tab.nowPlaying)
        })
        .navigationTitle(workoutManager.selectedWorkout?.name ?? "")
        .navigationBarBackButtonHidden(true)
        .toolbar(selection == .nowPlaying ?  .hidden : .automatic)
        .onChange(of: workoutManager.running) { oldValue, newValue in
            displayMetricsView()
        }
        .tabViewStyle(
            PageTabViewStyle(indexDisplayMode: isLuminaceReduced ? .never : .automatic)
        )
        .onChange(of: isLuminaceReduced) { oldValue, newValue in
            displayMetricsView()
        }
    }

    private func displayMetricsView() {
        withAnimation {
            selection = .metrics
        }
    }
}

#Preview {
    SessionPagingView().environmentObject(WorkoutManager())
}
