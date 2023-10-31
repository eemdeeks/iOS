//
//  WorkoutProjectApp.swift
//  WorkoutProject
//
//  Created by 박승찬 on 10/30/23.
//

import SwiftUI

@main
struct WorkoutProjectApp: App {
    private let workoutManager = WorkoutManager.shared
    
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .phone {
                PlayListView().environmentObject(workoutManager)
            } else {
                Text("빈화면")
            }
        }
    }
}
