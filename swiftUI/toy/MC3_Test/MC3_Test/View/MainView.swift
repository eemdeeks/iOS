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
                        ForEach(viewModel.rooms, id: \.self) { room in
                            Button {
                                
                            } label: {
                                VStack{
                                    Text("방 이름: \(room.name)")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                    Text("방 인원: \(room.UIDs.map{String($0)}.joined(separator: ","))")
                                        .font(.headline)
                                        .foregroundColor(.gray)
                                }
                                .frame(height: 110)
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 4)
                                )
                                
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                    
                }
                .listStyle(PlainListStyle())
                .refreshable {
                    viewModel.fetchItem()
                }
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
        .task {
            viewModel.fetchItem()
        }
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
    
    private var roomsListEmptyItem: some View {
        Button {
            
        } label: {
            VStack{
                Text("아직 방이 없어요.\n방을 만들어 주세요 !")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
            .frame(height: 110)
            .frame(maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 4)
            )
            
        }
        .listRowSeparator(.hidden)
        
    }
}


