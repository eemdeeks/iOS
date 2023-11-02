//
//  AlarmTabView.swift
//  pointCoding
//
//  Created by 박승찬 on 11/2/23.
//

import SwiftUI

struct AlarmTabView: View {
    var body: some View {
        TabView {
            WorldClockView()
                .tabItem {
                    Label("세계 시계", systemImage: "globe")
                }
            AlarmView()
                .tabItem {
                    Label("알람", systemImage: "alarm")
                }
            StopWatchView()
                .tabItem {
                    Label("스톱워치", systemImage: "stopwatch")
                }
            TimerView()
                .tabItem {
                    Label("타이머", systemImage: "timer")
                }
        }
        .tint(.orange)
    }
}

#Preview {
    AlarmTabView()
}
