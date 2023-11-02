//
//  pointCodingApp.swift
//  pointCoding
//
//  Created by 박승찬 on 11/2/23.
//

import SwiftUI

@main
struct pointCodingApp: App {
    private let alarmManager = AlarmManager.shared

    var body: some Scene {
        WindowGroup {
            AlarmTabView()
                .environment(\.colorScheme, .dark)
                .environmentObject(alarmManager)
        }
    }
}
