//
//  CUAlarkmView.swift
//  pointCoding
//
//  Created by 박승찬 on 11/3/23.
//

import SwiftUI

struct CUAlarmView: View {
    @Environment(AlarmManager.self) var alarmManager: AlarmManager

    @Environment(\.dismiss) var dismiss

    @State var date: Date = Date()
    @State var reAlarmBool: Bool = true

    @Bindable var alarm: Alarm

    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("", selection: $date, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .frame(height: 150)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
//                DatePicker("",selection: Bindable(alarmManager).etcAlarms[0].date, displayedComponents: .hourAndMinute)
//                    .datePickerStyle(.wheel)
                List {
                    HStack {
                        Text("반복")
                        Spacer()
                    }
                    HStack {
                        Text("레이블")
                        Spacer()
                    }
                    HStack {
                        Text("사운드")
                        Spacer()
                    }
                    HStack {
                        Toggle("다시 알림", isOn: $reAlarmBool)
                    }
                }
                .scrollDisabled(true)
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        dismiss()
                    } label: {
                        Text("취소")
                            .tint(.orange)
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        if alarmManager.createETCAlarmBool {
                            alarmManager.createEtcAlarm(date)
                        } else {
                            alarmManager.updateETCAlarm(date, alarm)
                        }
                        dismiss()
                    } label: {
                        Text("저장")
                            .tint(.orange)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text(alarmManager.createETCAlarmBool ? "알람추가": "알람편집")
                        .fontWeight(.semibold)
                }
            }
        }
    }
}
