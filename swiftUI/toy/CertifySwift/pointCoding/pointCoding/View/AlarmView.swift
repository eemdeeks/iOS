//
//  AlarmView.swift
//  pointCoding
//
//  Created by 박승찬 on 11/2/23.
//

import SwiftUI

@Observable
final class Alarm: Identifiable {
    var date: Date
    var isOn: Bool
    init(date: Date, isOn: Bool) {
        self.date = date
        self.isOn = isOn
    }
}

//class AlarmManager: ObservableObject {
//    static let shared = AlarmManager()
//
//    @Published var alarms: [Alarm] = []
//}
@Observable
class AlarmManager {
    var mainAlarm: [Alarm]
    var etcAlarms: [Alarm]
    var createETCAlarmBool: Bool
    init(mainAlarm: [Alarm] = [], etcAlarms: [Alarm] = [], createETCAlarmBool: Bool = false) {
        self.mainAlarm = mainAlarm
        self.etcAlarms = etcAlarms
        self.createETCAlarmBool = createETCAlarmBool
    }

    func createEtcAlarm(_ date: Date) {
        etcAlarms.append(Alarm(date: date, isOn: true))
    }
    func updateETCAlarm(_ date: Date,_ alarm: Alarm) {
        alarm.date = date
    }

    func removeEtcAlarm(_ alarm: Alarm) {
        for index in 0 ..< etcAlarms.count {
            if etcAlarms[index].id == alarm.id {
                etcAlarms.remove(at: index)
                break
            }
        }
    }
    func removeEtcAlarmUseIndex(_ offset: IndexSet) {
        etcAlarms.remove(atOffsets: offset)
    }
}

struct AlarmView: View {
    @Environment(AlarmManager.self) var alarmManager: AlarmManager

    @State var editMode: EditMode = .inactive
    @State var editETCAlarm: Bool = false

    enum CellType {
        case noAlarm, alarm, etcAlarm
    }
    enum TitleType {
        case sleep, etc
    }

    var body: some View {
        NavigationStack {
            List {
                Title(titleType: .sleep)
                    .listSectionSeparator(.hidden)
                if alarmManager.mainAlarm.isEmpty {
                    Cell(cellType: .noAlarm, alarmData: Alarm(date: Date(), isOn: false))

                } else {
                    Cell(cellType: .alarm, alarmData: alarmManager.mainAlarm[0])

                }
                if !alarmManager.etcAlarms.isEmpty {
                    Title(titleType: .etc)
                    ForEach(alarmManager.etcAlarms) { alarm in
                        NavigationLink(destination: CUAlarmView(date: alarm.date, alarm: alarm)) {
                            Cell(cellType: .etcAlarm, alarmData: alarm)
                        }
                    }
                    .onDelete{
                        alarmManager.removeEtcAlarmUseIndex($0)
                    }
                }
            }
            .environment(\.editMode, $editMode)
            .listStyle(.inset)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    EditButton()
                }
                ToolbarItem(placement: .primaryAction) {
                    Button{
                        alarmManager.createETCAlarmBool = true
                    } label: {
                        Image(systemName: "plus")
                            .tint(.orange)
                    }
                }
            }
            .environment(\.editMode, $editMode)
            .navigationTitle("알람")
        }
    }
    struct Title: View {
        let titleType: TitleType

        var body: some View {
            VStack {
                Spacer()
                HStack {
                    switch titleType {
                    case .sleep:
                        Image(systemName: "bed.double.fill")
                        Text("수면 | 기상")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    case .etc:
                        Text("기타")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                }
                .frame(height: 30)
                .padding(.bottom,5)
            }
        }

    }

    struct Cell: View {
        let cellType: CellType
        @Bindable var alarmData: Alarm

        var body: some View {
            VStack {
                switch cellType {
                case .noAlarm:
                    HStack {
                        VStack {
                            Text("알람 없음")
                                .font(.largeTitle)
                                .foregroundStyle(Color.secondary)

                        }
                        Spacer()
                        Button {
                        } label: {
                            Text("변경")
                                .foregroundStyle(Color.orange)
                                .padding(5)
                                .padding(.horizontal,5)
                                .background(.ultraThinMaterial)
                                .cornerRadius(15)
                        }
                    }
                case .alarm:
                    HStack {
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
                    }
                    HStack {
                        Text("내일만")
                        Spacer()
                    }
                case .etcAlarm:
                    HStack(alignment: .bottom){
                        Text("\(alarmData.date, formatter: Date.dateFormatter)")
                            .font(.title)
                            .foregroundStyle(alarmData.isOn ? Color.white: Color.secondary)
                        Text("\(alarmData.date, formatter: Date.timeFormatter)")
                            .font(.system(size: 60))
                            .fontWeight(.thin)
                            .foregroundStyle(alarmData.isOn ? Color.white: Color.secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Toggle("",isOn: $alarmData.isOn)
                    }
                    HStack {
                        Text("알람")
                            .foregroundStyle(alarmData.isOn ? Color.white: Color.secondary)
                        Spacer()
                    }
                }
            }
        }
    }

}

extension Date {
    static let timeFormatter: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "h:mm"
        dateFormat.locale = Locale(identifier: "ko_KR")
        return dateFormat
    }()

    static let dateFormatter: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "a"
        dateFormat.locale = Locale(identifier: "ko_KR")
        return dateFormat
    }()
}
