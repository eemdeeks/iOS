//
//  AlarmView.swift
//  pointCoding
//
//  Created by 박승찬 on 11/2/23.
//

import SwiftUI
struct Alarm {
    var date: Date
    var isOn: Bool
}

class AlarmManager: ObservableObject {
    static let shared = AlarmManager()

    @Published var alarms: [Alarm] = []
}

struct AlarmView: View {

    @EnvironmentObject var alarmManager: AlarmManager

    enum CellType {
        case title, etcTitle, noAlarm, alarm, etcAlarm
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                Cell(cellType: .title)
                Cell(cellType: .noAlarm)
                if !alarmManager.alarms.isEmpty {
                    Cell(cellType: .etcTitle)
                    Cell(cellType: .etcAlarm)
                }
            }
            .navigationTitle("알람")
        }
    }

    struct Cell: View {
        let cellType: CellType
        var alarmData: Alarm? = nil
        @State var toggleOn: Bool = true

        var body: some View {
            VStack {
                HStack {
                    switch cellType {
                    case .title:
                        Image(systemName: "bed.double.fill")
                        Text("수면 | 기상")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    case .etcTitle:
                        Text("기타")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    case .noAlarm:
                        VStack {
                            Text("알람 없음")
                                .font(.largeTitle)
                                .foregroundStyle(Color.secondary)

                        }
                        Spacer()
                        Button {
                        } label: {
                            Text("변경")
                                .tint(.orange)
                                .padding(5)
                                .padding(.horizontal,5)
                                .background(.ultraThinMaterial)
                                .cornerRadius(15)
                        }

                    case .alarm:
                        Text("cell")
                        Spacer()
                        Button {
                        } label: {
                            Text("변경")
                                .tint(.orange)
                                .padding(5)
                                .padding(.horizontal,5)
                                .background(.gray)
                                .cornerRadius(15)
                        }
                    case .etcAlarm:
                        Text("11:42")
                            .font(.largeTitle)
                            .foregroundStyle(Color.secondary)
                        Spacer()
                        Toggle("",isOn: $toggleOn)
                            .onChange(of: toggleOn) { oldValue, newValue in

                            }
                    }
                }
                Divider()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    AlarmView()
        .environmentObject(AlarmManager.shared)
}
