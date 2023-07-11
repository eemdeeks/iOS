//
//  UpdateProfileView.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/11.
//

import SwiftUI

struct UpdateProfileView: View {
    
    @StateObject var viewModel: UpdateProfileViewModel
 
    var body: some View {
        VStack {
            header
            Spacer()
            profileImage
            Spacer()
            profileName
            saveButton
            Spacer()
        }
        .onAppear {
            viewModel.fetchUID()
        }
        .padding()
    }
}

extension UpdateProfileView {
    private var header: some View {
        Text("프로필 설정")
            .font(.headline)
            .underline()
    }
    
    private var profileImage: some View {
        Button {
            
        } label: {
            Image(viewModel.profileImage)
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .padding()
        }
    }
    
    private var profileName: some View {
        TextField(viewModel.profileName, text: $viewModel.profileName )
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var saveButton: some View {
        Button {
            viewModel.clickedSaveButton()
        } label: {
            Text("저장하기")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
        }
    }
}
