//
//  RoomView.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/12.
//

import SwiftUI

struct CreateRoomView: View {
    
    @ObservedObject var viewModel = CreateRoomViewModel()
    
    var body: some View {
        VStack {
            header
            roomNameField
            Spacer()
            completeButton
        }
        .padding()
    }
}


extension CreateRoomView {
    private var header: some View {
        Text("방 만들기")
            .font(.headline)
            .underline()
            .padding()
    }
    
    private var roomNameField: some View {
        TextField("방 이름을 정해주세요", text: $viewModel.roomName )
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var completeButton: some View {
        Button {
            viewModel.clickedCompleteButton()
        } label: {
            Text("방 생성 완료!")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
        }
    }
}
