//
//  MetricsView.swift
//  WorkoutProject Watch App
//
//  Created by 박승찬 on 10/30/23.
//

import SwiftUI

struct MetricsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ElapsedTimeView(
                elapsedTime: 3 * 60 + 15.25,
                showSubseconds: true
            ).foregroundStyle(Color.yellow)
            Text(
                Measurement(
                    value: 47,
                    unit: UnitEnergy.kilocalories
                ).formatted(
                    .measurement(
                        width: .abbreviated,
                        usage: .workout,
                        numberFormatStyle: .number
                    )
                )
            )
            Text(
                153.formatted(
                    .number.precision(.fractionLength(0)))
                + " bpm"
            )
            Text(
                Measurement(
                    value: 515,
                    unit: UnitLength.meters
                ).formatted(
                    .measurement(
                        width: .abbreviated,
                        usage: .road)
                )
            )
        }
        .font(.system(.title, design: .rounded)
            .monospacedDigit()
            .lowercaseSmallCaps()
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .ignoresSafeArea(edges: .bottom)
        .scenePadding()
    }
}

#Preview {
    MetricsView()
}
