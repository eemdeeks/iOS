//
//  SetNameView.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/10.
//

import SwiftUI

struct SetNameView: View {
    
    @StateObject private var viewModel = SetNameViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                header
                textField
                Spacer()
                setButton
                    
            }
            .padding()
            .background(
                NavigationLink(destination: SetImageView(),isActive: $viewModel.goToSetImgaeView){
                
            })

        }.onAppear{
            viewModel.fetchUID()
        }
    }
}

struct SetNameView_Previews: PreviewProvider {
    static var previews: some View {
        SetNameView()
    }
}

extension SetNameView {
    private var header: some View {
        Text("닉네임을 정해주세요 :)")
            .font(.headline)
            .underline()
    }
    
    private var textField: some View {
        TextField("닉네임", text: $viewModel.name )
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var setButton: some View {
        Button {
            viewModel.nextButtonPressed()
        } label: {
            Text("다음")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
        }
    }
}
