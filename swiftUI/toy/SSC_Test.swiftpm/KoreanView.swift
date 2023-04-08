//
//  KoreanView.swift
//  SSC_Test
//
//  Created by 박승찬 on 2023/04/05.
//

import SwiftUI

struct KoreanView: View {
    
    @ObservedObject var viewModel: KoreanViewModel
    
    var body: some View {
        HStack{
            VStack{
                ZStack{
                    Image("blank")
                    Text(viewModel.myAnswer.text[0])
                }
                
            }
            VStack{
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㄱ", index: 0)
                        print("버튼 눌림")
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                }
                HStack{
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                }
                HStack{
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                }
                HStack{
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                }
                HStack{
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                }
                HStack{
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                }
            }
        }
    }
}

struct KoreanView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = KoreanViewModel(myAnswer: Model())
        return KoreanView(viewModel: viewModel)
    }
}
struct KoreanBtnImage: View {
    var imageName: String
    var frameSize : CGFloat = UIScreen.main.bounds.size.width/7
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: frameSize, height: frameSize)
    }
}
