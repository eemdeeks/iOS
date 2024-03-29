//
//  WorkoutProjectApp.swift
//  WorkoutProject Watch App
//
//  Created by 박승찬 on 10/30/23.
//

import SwiftUI

@main
struct WorkoutProject_Watch_AppApp: App {
    @StateObject var workoutManager = WorkoutManager()

    var body: some Scene {
        WindowGroup { 
            NavigationView {
                StartView()
            }
            .sheet(isPresented: $workoutManager.showingSummaryView) {
                SummaryView()
            }
            .environmentObject(workoutManager)
        }
    }
}
