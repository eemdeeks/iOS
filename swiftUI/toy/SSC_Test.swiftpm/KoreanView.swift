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
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width/14*6)
                    Text(viewModel.myAnswer.problem)
                        .font(.system(size: 100))
                }
                HStack{
                    ForEach(0..<6){ index in
                        BlankImage(imageName: viewModel.myAnswer.imageKey[0].key[index],text: viewModel.myAnswer.text[0].text[index])
                    }
                }
                HStack{
                    ForEach(0..<6){ index in
                        BlankImage(imageName: viewModel.myAnswer.imageKey[1].key[index],text: viewModel.myAnswer.text[1].text[index])
                    }
                }
                HStack{
                    ForEach(0..<6){ index in
                        BlankImage(imageName: viewModel.myAnswer.imageKey[2].key[index],text: viewModel.myAnswer.text[2].text[index])
                    }
                }
                HStack{
                    ForEach(0..<6){ index in
                        BlankImage(imageName: viewModel.myAnswer.imageKey[3].key[index],text: viewModel.myAnswer.text[3].text[index])
                    }
                }
                HStack{
                    ForEach(0..<6){ index in
                        BlankImage(imageName: viewModel.myAnswer.imageKey[4].key[index],text: viewModel.myAnswer.text[4].text[index])
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.size.width/2)
            VStack{
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㄱ")
                    }label: {
                        KoreanBtnImage(imageName: "korean1")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㄴ")
                    }label: {
                        KoreanBtnImage(imageName: "korean2")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㄷ")
                    }label: {
                        KoreanBtnImage(imageName: "korean3")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㄹ")
                    }label: {
                        KoreanBtnImage(imageName: "korean4")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㅁ")
                    }label: {
                        KoreanBtnImage(imageName: "korean5")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅂ")
                    }label: {
                        KoreanBtnImage(imageName: "korean6")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅅ")
                    }label: {
                        KoreanBtnImage(imageName: "korean7")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅇ")
                    }label: {
                        KoreanBtnImage(imageName: "korean8")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㅈ")
                    }label: {
                        KoreanBtnImage(imageName: "korean9")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅊ")
                    }label: {
                        KoreanBtnImage(imageName: "korean10")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅋ")
                    }label: {
                        KoreanBtnImage(imageName: "korean11")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅌ")
                    }label: {
                        KoreanBtnImage(imageName: "korean12")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㅍ")
                    }label: {
                        KoreanBtnImage(imageName: "korean13")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅎ")
                    }label: {
                        KoreanBtnImage(imageName: "korean14")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅏ")
                    }label: {
                        KoreanBtnImage(imageName: "korean15")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅑ")
                    }label: {
                        KoreanBtnImage(imageName: "korean16")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㅓ")
                    }label: {
                        KoreanBtnImage(imageName: "korean17")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅕ")
                    }label: {
                        KoreanBtnImage(imageName: "korean18")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅗ")
                    }label: {
                        KoreanBtnImage(imageName: "korean19")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅛ")
                    }label: {
                        KoreanBtnImage(imageName: "korean20")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㅜ")
                    }label: {
                        KoreanBtnImage(imageName: "korean21")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅠ")
                    }label: {
                        KoreanBtnImage(imageName: "korean22")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅡ")
                    }label: {
                        KoreanBtnImage(imageName: "korean23")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅣ")
                    }label: {
                        KoreanBtnImage(imageName: "korean24")
                    }
                }
                HStack{
                    Button{
                        viewModel.compareAnswer()
                    } label: {
                        ZStack{
                            Image("blank")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.size.width/5, height: UIScreen.main.bounds.size.width/10)
                            Text("OK")
                        }
                    }
                    
                    .alert(isPresented: $viewModel.answerBool) {
                                Alert(title: Text("That's right!"), message: nil,
                                      dismissButton: .default(Text("OK")))
                            }
                    .alert(isPresented: $viewModel.wrongBool){
                        Alert(title: Text("You're wrong!!"), message: Text("The Answer is \"이야기\"!!"),
                              dismissButton: .default(Text("OK")))
                    }
                    Button{
                        viewModel.deleteAnswer()
                    } label: {
                        ZStack{
                            Image("blank")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.size.width/5, height: UIScreen.main.bounds.size.width/10)
                            Text("delete")
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.size.width/2)
        }
    }
}

struct KoreanView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = KoreanViewModel(myAnswer: .story)
        return KoreanView(viewModel: viewModel)
    }
}
struct KoreanBtnImage: View {
    var imageName: String
    var frameSize : CGFloat = UIScreen.main.bounds.size.width/10
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: frameSize, height: frameSize)
    }
}

struct BlankImage: View {
    var imageName: String
    var text: String
    var frameSize : CGFloat = UIScreen.main.bounds.size.width/14
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
            Text(text)
        }
    }
}
