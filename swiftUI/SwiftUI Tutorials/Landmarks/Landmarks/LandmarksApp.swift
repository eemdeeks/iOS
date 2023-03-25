//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 박승찬 on 2023/03/21.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
