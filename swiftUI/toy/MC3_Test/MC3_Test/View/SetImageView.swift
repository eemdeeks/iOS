//
//  SetImageView.swift
//  MC3_Test
//
//  Created by 박승찬 on 2023/07/10.
//

import SwiftUI

struct SetImageView: View {
    
    let cats : [[String]] = [["blueCat","scotCat","oddCat"],["blackCat","blueCat","shamCat"]]
    
    
    @StateObject private var viewModel = SetImageViewModel()
    
    var body: some View {
        VStack{
            header
            catsBtn
            Spacer()
            completeButton
        }
        .navigationBarBackButtonHidden(true)
        .padding()
        .background(
            NavigationLink(destination: MainView(viewModel: MainViewModel(profile: viewModel.profile)),isActive: $viewModel.goToMainView){
            
        })
    }
}

struct SetImageView_Previews: PreviewProvider {
    static var previews: some View {
        SetImageView()
    }
}

extension SetImageView {
    private var header: some View {
        Text("고양이를 선택해주세요")
            .font(.headline)
            .underline()
    }
    
    private var catsBtn: some View {
        ForEach(self.cats, id: \.self){ catsRaw in
            HStack{
                ForEach(catsRaw, id: \.self){ cat in
                    Button {
                        viewModel.clickedCatBtn(cat)
                    } label: {
                        Image(cat)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                }
            }
        }
    }
    
    private var completeButton: some View {
        Button {
            viewModel.completeButtonPressed()
        } label: {
            Text("완료")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
        }
    }
    
}
