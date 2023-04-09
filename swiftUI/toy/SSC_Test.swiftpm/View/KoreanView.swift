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
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[0],text: "ㄱ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㄴ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[1], text: "ㄴ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㄷ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[2], text: "ㄷ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㄹ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[3], text: "ㄹ")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㅁ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[4],text: "ㅁ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅂ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[5],text: "ㅂ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅅ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[6],text: "ㅅ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅇ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[7],text: "ㅇ")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㅈ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[8],text: "ㅈ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅊ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[9],text: "ㅊ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅋ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[10],text: "ㅋ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅌ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[11],text: "ㅌ")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㅍ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[12],text: "ㅍ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅎ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[13],text: "ㅎ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅏ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[14],text: "ㅏ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅑ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[15],text: "ㅑ")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㅓ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[16],text: "ㅓ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅕ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[17],text: "ㅕ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅗ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[18],text: "ㅗ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅛ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[19],text: "ㅛ")
                    }
                }
                HStack{
                    Button{
                        viewModel.inputKorean(text: "ㅜ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[20],text: "ㅜ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅠ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[21],text: "ㅠ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅡ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[22],text: "ㅡ")
                    }
                    Button{
                        viewModel.inputKorean(text: "ㅣ")
                    }label: {
                        KoreanBtnImage(imageName: viewModel.myAnswer.imageKey[0].btnKey[23],text: "ㅣ")
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
                    .alert("Good job!",isPresented: $viewModel.answerBool) {
                        Button("OK", role: .cancel){}
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
    var text: String
    var frameSize : CGFloat = UIScreen.main.bounds.size.width/10
    var body: some View {
        ZStack{
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: frameSize, height: frameSize)
            Text(text)
                .foregroundColor(.black)
        }
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
