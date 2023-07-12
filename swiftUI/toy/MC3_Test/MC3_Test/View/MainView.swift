//
//  MainView.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/11.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        VStack{
            HStack{
                header
                Spacer()
                setProfileButton
                    .background(
                        NavigationLink(destination: UpdateProfileView(viewModel: UpdateProfileViewModel(profile: viewModel.profile, delegate: viewModel)) ,isActive: $viewModel.goToUpdateProfileView){})
            }.padding()
            
            Spacer()
            ZStack{
                List{
                    if viewModel.rooms.isEmpty {
                        roomsListEmptyItem
                    }else {
                        Text(viewModel.profile.name)
                    }
                    
                }.listRowSeparator(.hidden)
                VStack{
                    Spacer()
                    createRoomButton
                        .background(
                            NavigationLink(destination: CreateRoomView() ,isActive: $viewModel.goToCreateRoomView){})
                }
            }
            
            
            
            Spacer()
            
            
        }
        .navigationBarBackButtonHidden()
    }
}

extension MainView {
    private var header: some View {
        Text("나의 방")
            .font(.headline)
            .underline()
            .padding()
    }
    
    private var setProfileButton: some View {
        Button {
            viewModel.clickedUpdateProfileButton()
        } label: {
            Image(viewModel.profile.imageKey ?? "")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 30)
                .padding()
        }
    }
    
    private var createRoomButton: some View {
        Button {
            viewModel.clickedCreateRoomButton()
        } label: {
            HStack{
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 30)
                    .padding()
            }
        }
    }
    
    private var roomsListItem: some View {
        Button {
            
        } label: {
            HStack{
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 30)
                    .padding()
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 2)
            }
        }
        
    }
    private var roomsListEmptyItem: some View {
        Button {
            
        } label: {
            HStack{
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 30)
                    .padding()
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 2)
            }
        }
        
    }
}
