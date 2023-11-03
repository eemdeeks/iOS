//
//  pointCodingApp.swift
//  pointCoding
//
//  Created by 박승찬 on 11/2/23.
//

import SwiftUI

@main
struct pointCodingApp: App {
    @State private var alarmManager = AlarmManager()

    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                AlarmTabView()
                    .sheet(isPresented: $alarmManager.createETCAlarmBool, content: {
                        CUAlarmView(alarm: Alarm(date: Date(), isOn: true))


                    })
            })
            .environment(alarmManager)
        }
    }
}
