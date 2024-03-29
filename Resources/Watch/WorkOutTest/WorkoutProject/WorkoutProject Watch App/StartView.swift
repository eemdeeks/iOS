//
//  ContentView.swift
//  WorkoutProject Watch App
//
//  Created by 박승찬 on 10/30/23.
//

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var workoutTypes: [HKWorkoutActivityType] = [.running, .soccer]

    var body: some View {
//        NavigationStack{
            List(workoutTypes) { workoutType in
                //            NavigationLink(workoutType.name, destination: SessionPagingView(), tag: workoutType, selection: $workoutManager.selectedWorkout)
                //                .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
                NavigationLink(
                        workoutType.name,
                        destination: SessionPagingView()
                    )
                    .simultaneousGesture(TapGesture().onEnded {
                        workoutManager.selectedWorkout = workoutType
                    })
            }
            
            .listStyle(.carousel)
            .navigationBarTitle("Workouts")
            .onAppear {
                workoutManager.requestAuthorization()
            }
//        }
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
