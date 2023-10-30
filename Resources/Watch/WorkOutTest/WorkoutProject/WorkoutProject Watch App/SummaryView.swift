//
//  SummaryView.swift
//  WorkoutProject Watch App
//
//  Created by 박승찬 on 10/31/23.
//

import SwiftUI
import HealthKit

struct SummaryView: View {
    @State private var durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading) {
                SummaryMetricView(title: "Total Time", value: durationFormatter.string(from: 30 * 60 + 15) ?? "")
                    .accentColor(.yellow)   //나중에 없어져서 바꿔줘야함
                SummaryMetricView(title: "Total Distance", value: Measurement(value: 1625, unit: UnitLength.meters).formatted(.measurement(width: .abbreviated,usage: .road)))
                    .accentColor(.green)
                SummaryMetricView(title: "Total Energy", value: Measurement(value: 96, unit: UnitEnergy.kilocalories).formatted(.measurement(width: .abbreviated,usage: .workout)))
                    .accentColor(.pink)
                SummaryMetricView(title: "Avg. Heart Rate", value: 143.formatted(.number.precision(.fractionLength(0))))
                    .accentColor(.red)

                Text("Activity Rings")
                ActivityRingsView(healthStore: HKHealthStore()).frame(width: 50, height: 50)
                
                Button("Done"){

                }

            }
            .scenePadding()
        }
        .navigationTitle("Summary")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SummaryView()
}

struct SummaryMetricView: View {
    var title: String
    var value: String

    var body: some View {
        Text(title)
        Text(value)
            .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
            .foregroundStyle(Color.accentColor)
        Divider()
    }
}
