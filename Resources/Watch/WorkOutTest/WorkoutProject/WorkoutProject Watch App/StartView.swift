//
//  ContentView.swift
//  WorkoutProject Watch App
//
//  Created by 박승찬 on 10/30/23.
//

import SwiftUI
import HealthKit

struct StartView: View {
    var workoutTypes: [HKWorkoutActivityType] = [.running, .soccer]

    var body: some View {
        List(workoutTypes) { workoutType in
            NavigationLink(
                workoutType.name
                , destination: Text(workoutType.name)
            ).padding(
                EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5)
            )
        }
        .listStyle(.carousel)
        .navigationTitle("Workouts")
    }
}

#Preview {
    StartView()
}

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }

    var name: String {
        switch self {
        case .running:
            return "Run"
        case .soccer:
            return "Football"
        default:
            return ""
        }

    }
}
