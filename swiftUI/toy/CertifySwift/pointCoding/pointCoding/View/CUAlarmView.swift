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


    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("", selection: $date, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
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
                            //alarmManager.updateEtcAlarm(date)
                        }
                        dismiss()
                    } label: {
                        Text("저장")
                            .tint(.orange)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text(alarmManager.createETCAlarmBool ? "알람추가": "알람수정")
                        .fontWeight(.semibold)
                }
            }
        }
    }
}
//
//#Preview {
//    CUAlarmView()
//}
