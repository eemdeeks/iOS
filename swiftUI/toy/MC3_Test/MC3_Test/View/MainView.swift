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
            }.padding()
            Spacer()
            Text(viewModel.profile.name)
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .background(
            NavigationLink(destination: UpdateProfileView(viewModel: UpdateProfileViewModel(profile: viewModel.profile)) ,isActive: $viewModel.goToUpdateProfileView){
        })
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
}
