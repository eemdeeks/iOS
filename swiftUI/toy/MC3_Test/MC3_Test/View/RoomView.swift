//
//  RoomView.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/13.
//

import SwiftUI

struct RoomView: View {
    @StateObject var viewModel: RoomViewModel
    var body: some View {
        VStack{
            header
            Spacer()
            ScrollView(.horizontal) {
                HStack{
                    ForEach(viewModel.users, id: \.self) { user in
                        Image("\(user.imageKey ?? "")")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 30)
                            .padding()
                    }
                    Image(systemName: "arrow.clockwise")
                        .onTapGesture {
                            print("userInfo refresh")
                        }
                }
                
            }
            Spacer()
        }.padding()
    }
}

extension RoomView {
    private var header: some View {
        Text(viewModel.roomInfo.name)
            .font(.headline)
            .underline()
            .padding()
    }
    
    private var setProfileButton: some View {
        Button {
            
        } label: {
            Image("")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 30)
                .padding()
        }
    }
}
